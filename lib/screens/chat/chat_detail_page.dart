import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starter_flutter/models/chat_message_model.dart';
import '../../models/person_chat_model.dart';
import '../jogs/edit_jog_page.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    Key? key,
    required this.name1,
    required this.name2,
    required this.image,
  }) : super(key: key);
  final String name1;
  final String name2;
  final String image;
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  String? docId;
  String? chatroomId;
  String? otherChatroomId;
  List<String> sentMessages = [];
  List<String> allMessages = [];
  PersonChat? person;
  PersonChat? otherPerson;
  PersonChat? personCompare;
  int counter = 0;
  int j = 0;
  List<String> test = [];
  List<String> newMessage = [];
  List<String> someMessages = [];
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> messages = [];
  List<ChatMessage> oldMessages = [];
  Map<String, DateTime> someMap = {};
  List<String> docsList = [];

  @override
  Widget build(BuildContext context) {
    chatroomId = "${widget.name2}_${widget.name1}";
    otherChatroomId = "${widget.name1}_${widget.name2}";
    Future getData(String chatroomId) async {
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

    getData(chatroomId!);
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collectionGroup('messages')
            .snapshots()
            .map((snapshot) => snapshot.docs
                .map((doc) => PersonChat().fromCollection(doc.data()))
                .toList()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final personsChat = snapshot.data as List<PersonChat>;
            getData(chatroomId!);
            messages.clear();
            var a = personsChat
                .where((element) => element.name!.contains(widget.name2))
                .toList();
            var b = a
                .where(
                    (element) => element.receiverName!.contains(widget.name1))
                .toList();
            b.sort((a, b) => a.time!.compareTo(b.time!));
            var c = personsChat
                .where((element) => element.name!.contains(widget.name1))
                .toList();
            var d = c
                .where(
                    (element) => element.receiverName!.contains(widget.name2))
                .toList();
            d.sort((a, b) => a.time!.compareTo(b.time!));
            var newList = b + d;
            newList.sort((a, b) => a.time!.compareTo(b.time!));
            newList.forEach((element) {
              if (element.name!.contains(widget.name2)) {
                if (!oldMessages.contains(element)) {
                  messages.add(ChatMessage(
                      messageContent: element.actualMessageText!,
                      messageType: 'sender'));
                }
              } else if (element.name!.contains(widget.name1)) {
                if (!oldMessages.contains(element))
                  messages.add(ChatMessage(
                      messageContent: element.actualMessageText!,
                      messageType: 'receiver'));
              }
            });
            getData(otherChatroomId!);
          }
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.image),
                        maxRadius: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.name1,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Online",
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.sticky_note_2,
                          color: Colors.black54,
                        ),
                        onPressed: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => AddEditJogPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  reverse: true,
                  child: ListView.builder(
                    itemCount: messages.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10, bottom: 60),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 14, right: 14, top: 4, bottom: 4),
                        child: Align(
                          alignment: (messages[index].messageType == "receiver"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages[index].messageType == "receiver"
                                  ? Colors.grey.shade200
                                  : Colors.blue[200]),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              messages[index].messageContent,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            await getData(chatroomId!);
                            DateTime now = DateTime.now();
                            counter += 1;
                            someMessages.add(messageController.text);
                            var _collectionReference =
                                FirebaseFirestore.instance;
                            await _collectionReference
                                .collection("ChatRoom")
                                .doc(docId)
                                .collection("messages")
                                .add({
                              "messageText": messageController.text,
                              "receiver": widget.name1,
                              "sender": widget.name2,
                              "timeStamp": DateTime.now()
                            });
                            await _collectionReference
                                .collection("ChatRoom")
                                .doc(docId)
                                .update({
                              "lastMessageText": messageController.text,
                              "lastMessageTime": DateFormat.Hms().format(now),
                              "profilePicture": widget.image,
                              "name": widget.name1,
                              "senderName": widget.name2
                            });
                            messageController.clear();
                            await getData(otherChatroomId!);
                            oldMessages = messages;
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          backgroundColor: Colors.blue,
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
