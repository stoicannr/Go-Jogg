import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_flutter/screens/chat/chat_detail_page.dart';
import 'package:starter_flutter/screens/chat/chat_screen.dart';

class PersonCard2 extends StatefulWidget {
  final String namePerson;
  final String sex, age, distance;
  final String location1, location2, location3;
  final String image;
  final String currentUserName;
  final String? uid;

  const PersonCard2({
    Key? key,
    required this.namePerson,
    required this.sex,
    required this.age,
    required this.distance,
    required this.location1,
    required this.location2,
    required this.location3,
    required this.image,
    required this.currentUserName,
    this.uid,
  }) : super(key: key);

  @override
  _PersonCard2State createState() => _PersonCard2State();
}

class _PersonCard2State extends State<PersonCard2> {
  String? docId;
  String? chatroomId;
  List<String> users = [];
  String? uid;

  @override
  Widget build(BuildContext context) {
    uid = widget.uid;
    if (users.length < 2) {
      users.add(widget.currentUserName);
      users.add(widget.namePerson);
    }
    chatroomId = "${widget.currentUserName}_${widget.namePerson}";

    Future getData() async {
      // Get docs from collection reference
      var querySnapshot = await FirebaseFirestore.instance
          .collection("ChatRoom")
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((element) {
                  if (element
                      .data()!
                      .toString()
                      .contains(chatroomId.toString())) {
                    docId = element.id;
                  }
                })
              });
    }

    getData();
    return Align(
      alignment: Alignment.center,
      child: ExpansionTile(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CircleAvatar(
            radius: 20.w,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(widget.image),
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            widget.namePerson,
            style: TextStyle(
              fontSize: 18.sp,
            ),
            textAlign: TextAlign.left,
          ),
        ]),
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 12.w, top: 8.h, bottom: 8.h, right: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.sex),
                    Text("Age: ${widget.age}"),
                    Text("Preferred Running distance: ${widget.distance}")
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SizedBox(
                    width: 70.w,
                    height: 70.h,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Color(0xFF241C1C),
                      splashColor: Colors.blue,
                      textColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () async {
                          // List<String> users = [];
                          // users.add(widget.currentUserName);
                          // users.add(widget.namePerson);
                          var _collectionReference = FirebaseFirestore.instance;
                          docId != null
                              ? await _collectionReference
                                  .collection("ChatRoom")
                                  .doc(docId)
                                  .update({
                                  "chatroomId":
                                      "${widget.currentUserName}_${widget.namePerson}",
                                  "users": users
                                })
                              : _collectionReference
                                  .collection("ChatRoom")
                                  .add({
                                  "chatroomId":
                                      "${widget.currentUserName}_${widget.namePerson}",
                                  "users": users
                                });
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatDetailPage(
                                          name1: widget.namePerson,
                                          name2: widget.currentUserName,
                                          image: widget.image,
                                        )));
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
