import 'package:flutter/cupertino.dart';

class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({
    required this.messageContent,
    required this.messageType
  });
  Map<String,dynamic > toJson() =>{
    'SentMessages' : messageContent,
    'messageType' : messageType,

  };
  static ChatMessage fromJson(Map<String,dynamic> json){
    return ChatMessage(
        messageContent: json['SentMessages'].toString(),
        messageType: json['messageType'].toString()
    );
  }
}