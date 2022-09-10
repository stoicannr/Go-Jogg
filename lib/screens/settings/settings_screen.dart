import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_flutter/screens/authentication/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../starter_app.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, required this.uid}) : super(key: key);

  final String uid;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? docId;
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('usersData');

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

  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  bool _setting = true;
  bool _setting2 = false;

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Text('Settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.sp))),
            // SettingsCard(settingIcon: Icon(Icons.bedtime),settingName: 'Dark Mode',docId: docId!,),
            Align(
              alignment: Alignment.center,
              child: SwitchListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: const Text("Dark Mode"),
                  value: _setting2,
                  onChanged: (bool value) async {
                    StarterApp.themeNotifier.value =
                        StarterApp.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                    final _collectionReference = FirebaseFirestore.instance;
                    await _collectionReference
                        .collection("usersData")
                        .doc(docId)
                        .update({'darkMode': _setting2.toString()});
                    setState(() {
                      _setting2 = value;
                    });
                  },
                  secondary: const Icon(Icons.bedtime)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: SizedBox(
                width: 320.w,
                height: 64.h,
                child: RaisedButton(
                  onPressed: () {
                    _authInstance.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Color(0xFFC8C4B7),
                  splashColor: Colors.blue,
                  textColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
