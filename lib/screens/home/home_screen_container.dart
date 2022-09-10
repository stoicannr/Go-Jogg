import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starter_flutter/screens/shared_elements/dropdown_list.dart';
import 'package:starter_flutter/models/user_model.dart' as UserModel;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeScreenContainer extends StatefulWidget {
  final String ProfileName;
  final String? ProfilePicture;
  final String uid;

  HomeScreenContainer({
    Key? key,
    required this.ProfileName,
    this.ProfilePicture,
    required this.uid,
  }) : super(key: key);

  @override
  _HomeScreenContainerState createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  var image;
  var tempImage;
  var tempSex;
  var tempUploadedImage;
  File? imageToUpload;
  String? sex;
  UserModel.User? person;
  TextEditingController ageController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  String? docId;
  String? downloadURL;
  String? location1, location2, location3;

  void parentChangeSex(newString) {
    setState(() {
      sex = newString.toString();
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      imageToUpload = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('usersData');

  @override
  Widget build(BuildContext context) {
    Future getData() async {
      // Get docs from collection reference
      var querySnapshot = await _collectionReference
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((element) {
                  if (element.data()!.toString().contains(widget.uid)) {
                    docId = element.id;
                  }
                })
              });
    }

    Future uploadImage(File imageForUpload) async {
      final postID = DateTime.now().microsecondsSinceEpoch.toString();
      var ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("${widget.uid}/images")
          .child("post_$postID");
      await ref.putFile(imageForUpload);
      downloadURL = await ref.getDownloadURL();
    }

    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('usersData')
            .snapshots()
            .map((snapshot) => snapshot.docs
                .map((doc) => UserModel.User.fromJson(doc.data()))
                .toList()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data as List<UserModel.User>;
            getData();
            for (var i = 0; i < users.length; i++) {
              if (users[i].uid == widget.uid) {
                person = users[i];
                tempImage = person?.image;
                tempSex = person?.sex;
                tempUploadedImage = person?.uploadedImage;
              }
            }
          }
          final oldAgeController = TextEditingController(text: person?.age);
          final oldDistanceController =
              TextEditingController(text: person?.distance);
          void printAgeLatestValue() {
            print(oldAgeController.text);
          }

          void printDistanceLatestValue() {
            print(oldDistanceController.text);
          }

          oldAgeController.addListener(printAgeLatestValue);
          oldDistanceController.addListener(printDistanceLatestValue);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h, bottom: 20.h),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        'Welcome, ${widget.ProfileName} , this is your profile',
                        // '${person?.uid}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24.sp))),
              ),
              Container(
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 8.w),
                        child: Stack(children: [
                          if (tempUploadedImage != null)
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(tempUploadedImage.toString()),
                              radius: 48.w,
                            )
                          else if (person?.image != null)
                            CircleAvatar(
                              backgroundImage: FileImage(File(person!.image)),
                              radius: 48.w,
                            )
                          else if (widget.ProfilePicture != null)
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  widget.ProfilePicture.toString()),
                              radius: 48.w,
                            )
                          else
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  "https://st.depositphotos.com/1779253/5140/v/450/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg"),
                              radius: 48.w,
                            ),
                          Positioned(
                              right: 8.w,
                              bottom: -5.h,
                              child: IconButton(
                                onPressed: pickImage,
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 35.w,
                                ),
                              ))
                        ])),
                    Text(
                      widget.ProfileName,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
              Container(
                height: 324.h,
                padding: EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.values[3],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownList(
                        option1: 'Male',
                        option2: 'Female',
                        option3: "Other",
                        title: 'Sex',
                        customFunction: parentChangeSex,
                        oldData: person?.sex,
                        sex: person?.sex,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: TextField(
                          controller: oldAgeController,
                          decoration: const InputDecoration(
                            labelText: 'Age',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: TextField(
                          controller: oldDistanceController,
                          decoration: const InputDecoration(
                            labelText: 'Favorite Distance(KM)',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 260.w, top: 80.h),
                child: RaisedButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0.w),
                    ),
                    onPressed: () async {
                      String? URL;
                      if (image != null) {
                        await uploadImage(image as File);
                        URL = downloadURL;
                      } else {
                        await uploadImage(File(person!.image));
                        URL = downloadURL;
                      }
                      final _collectionReference = FirebaseFirestore.instance;

                      docId != null
                          ? await _collectionReference
                              .collection("usersData")
                              .doc(docId)
                              .update({
                              'age': oldAgeController.text,
                              'distance': oldDistanceController.text,
                              "sex": sex ?? tempSex,
                              'uid': widget.uid,
                              'image': image != null ? image.path : tempImage,
                              'name': widget.ProfileName,
                              'uploadedImage': downloadURL,
                              'location1': location1,
                              'location2': location2,
                              'location3': location3
                            })
                          : FirebaseFirestore.instance
                              .collection('usersData')
                              .add({
                              'age': oldAgeController.text,
                              'distance': oldDistanceController.text,
                              "sex": sex ?? tempSex,
                              'uid': widget.uid,
                              'image': image != null ? image.path : tempImage,
                              'name': widget.ProfileName,
                              'uploadedImage': downloadURL,
                              'location1': location1,
                              'location2': location2,
                              'location3': location3
                            });
                    },
                    child: const Text(
                      "Save changes",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    )),
              ),
            ],
          );
        });
  }
}
