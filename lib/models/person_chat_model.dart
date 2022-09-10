import 'dart:collection';

import 'package:flutter/cupertino.dart';

class PersonChat {
  String? name;
  String? messageText;
  String? actualMessageText;
  String? imageURL;
  String? time;
  String? chatroomId;
  String? receiverName;
  PersonChat({
    this.name,
    this.imageURL,
    this.messageText,
    this.time,
    this.chatroomId,
    this.actualMessageText,
    this.receiverName
  }
  );
  //  PersonChat fromJson(Map<String, dynamic> json){
  //   List<String> listaNoua = [];
  //   var a = json as Map<String,dynamic>;
  //   var x = a['SentMessages'] as List;
  //   x.forEach((element) {
  //     listaNoua.add(element.toString());
  //   });
  //
  //
  //   return PersonChat(
  //     messageText: listaNoua,
  //     chatroomId: json['chatroomId'].toString()
  //       );
  // }
  PersonChat fromJson2(Map<String,dynamic> json){
     return PersonChat(
       name: json['name'].toString(),
       time: json['lastMessageTime'].toString(),
       imageURL: json['profilePicture'].toString(),
       messageText: json['lastMessageText'].toString(),
       receiverName: json['senderName'].toString()

     );
  }


  PersonChat fromCollection(Map<String,dynamic> json){
    return PersonChat(
      name: json['sender'].toString(),
      actualMessageText: json['messageText'].toString(),
      time: json['timeStamp'].toString(),
      receiverName: json['receiver'].toString()
    );
  }

}