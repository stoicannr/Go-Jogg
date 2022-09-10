import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:starter_flutter/screens/chat/chat_screen.dart';
import 'package:starter_flutter/screens/find/find_screen.dart';
import 'package:starter_flutter/screens/home/home_screen_container.dart';
import 'package:starter_flutter/screens/map/google_maps_screen.dart';
import 'package:starter_flutter/screens/settings/settings_screen.dart';
import 'package:starter_flutter/screens/shared_elements/person_card2.dart';
import 'package:starter_flutter/models/user_model.dart' as UserModel;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:darq/darq.dart';
import 'package:starter_flutter/screens/starter_app.dart';

class HomeScreen extends StatefulWidget {
  final String profileName;
  final String? profilePicture;
  final String uid;

  const HomeScreen({
    Key? key,
    required this.profileName,
    this.profilePicture,
    required this.uid,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PersonCard2> personCards = [];
  List<PersonCard2> distinctPersonCards = [];
  List<UserModel.User> appUsers = [];

  int length = 0;
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  PageController pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('usersData');
  String? docId;

  Future getData() async {
    // Get docs from collection reference
    var querySnapshot =
        await _collectionReference.get().then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((element) {
                if (element.data()!.toString().contains(widget.uid)) {
                  docId = element.id;
                }
              })
            });
  }

  Future<Position> _getCurrentPosition() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return Future.error('Location services are disabled.');
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final position = await Geolocator.getCurrentPosition();
    final _collectionReference = FirebaseFirestore.instance;
    debugPrint(docId);
    _collectionReference.collection("usersData").doc(docId).update({
      'lat': (position.latitude).toString(),
      'long': position.longitude.toString()
    });
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return position;
  }

  Future<String> downloadURL(String imageName) async {
    final downloadURL =
        await storage.ref('usersImages/$imageName').getDownloadURL();
    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('usersData')
            .snapshots()
            .map((snapshot) => snapshot.docs
                .map((doc) => UserModel.User.fromJson(doc.data()))
                .toList()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var users = snapshot.data as List<UserModel.User>;
            appUsers = users;
            debugPrint('builder: $appUsers');
            _getCurrentPosition();
            var incognitoUsers =
                users.where((element) => element.incognitoMode == "true");
            length = users.length - incognitoUsers.length - 1;
            for (int i = 0; i < length; i++) {
              if (users[i].uid != widget.uid &&
                  users[i].incognitoMode != "true") {
                personCards.add(PersonCard2(
                  uid: users[i].uid,
                  namePerson: users[i].name,
                  sex: users[i].sex,
                  age: users[i].age,
                  distance: users[i].distance,
                  location1: '1: ${users[i].location1}',
                  location2: '2: ${users[i].location2}',
                  location3: '3: ${users[i].location3}',
                  image: users[i].uploadedImage,
                  currentUserName: widget.profileName,
                ));
                distinctPersonCards =
                    personCards.distinct((d) => d.uid.toString()).toList();
              }
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                if (users[i].uid == widget.uid) {
                  var a = users[i].darkMode;
                  if (a == 'true') {
                    StarterApp.themeNotifier.value = ThemeMode.dark;
                  } else if (a == 'false') {
                    StarterApp.themeNotifier.value = ThemeMode.light;
                  }
                }
              });
            }
          }

          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: PageView(
                controller: pageController,
                children: [
                  HomeScreenContainer(
                    ProfileName: widget.profileName,
                    ProfilePicture: widget.profilePicture,
                    uid: widget.uid,
                  ),
                  FindScreen(
                    personCards: distinctPersonCards,
                    length: length,
                  ),
                  ChatScreen(currentUserName: widget.profileName),
                  // JogsScreen(),
                  SettingsScreen(
                    uid: widget.uid,
                  ),
                  GoogleMapScreen(
                    uid: widget.uid,
                    appUsers: appUsers,
                    name: widget.profileName,
                  )
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedFontSize: 20,
                selectedIconTheme:
                    IconThemeData(color: Colors.amberAccent, size: 40),
                selectedItemColor: Colors.amberAccent,
                items: const [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.blue,
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.blue,
                    icon: Icon(Icons.search),
                    label: "Find",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.blue,
                    icon: Icon(Icons.mail),
                    label: "Chat",
                  ),
                  // BottomNavigationBarItem(
                  //   backgroundColor: Colors.blue,
                  //   icon: Icon(Icons.directions_run),
                  //   label: "Jogs",
                  // ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.blue,
                    icon: Icon(Icons.settings),
                    label: "Settings",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.blue,
                    icon: Icon(Icons.map_outlined),
                    label: "Map",
                  ),
                ],
              ));
        });
  }
}
