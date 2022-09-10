import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_flutter/models/person_chat_model.dart';
import 'conversation_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget{
  const ChatScreen({
    Key? key,
    required this.currentUserName
  }) : super(key: key);
  final String currentUserName;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  @override
  initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      searchTextEditingController.addListener(onSearchChanged);
    });
  }
  @override
  dispose(){
    searchTextEditingController.removeListener(onSearchChanged);
    searchTextEditingController.dispose();
    super.dispose();
  }
  onSearchChanged(){
   searchResultsList();
  }
  searchResultsList(){
    WidgetsBinding.instance!.addPostFrameCallback((_) {  List<PersonChat> showResults = [];
    if(searchTextEditingController.text != ""){
      for(var user in lista){
        var name = user.name!.toLowerCase();
        if(name.contains(searchTextEditingController.text.toLowerCase())){
          showResults.add(user);
        };
      }

    } else {
      showResults = List.from(lista);
    }
    if(this.mounted){
      setState(() {
        filteredList = showResults;
      });
    }
    });
  }
  List<PersonChat> lista = [];
  List<PersonChat> filteredList = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: FirebaseFirestore.instance
          .collection('ChatRoom')
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => PersonChat().fromJson2(doc.data()))
          .toList()),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final personChats = snapshot.data as List<PersonChat>;
          lista = personChats.where((element) => element.name != widget.currentUserName && element.receiverName == widget.currentUserName).toList();
          for(var i = 0; i<lista.length; i++){
            if(lista[i].time == 'null')
              lista.remove(lista[i]);
            if(lista[i].name == widget.currentUserName)
              lista.remove(lista[i]);
          }
          searchResultsList();
        }
        return SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16,left: 16,right: 16),
                    child: GestureDetector(
                      child: TextField(
                        controller: searchTextEditingController,
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade100
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: filteredList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return ConversationList(
                        currentUserName: widget.currentUserName,
                        name: filteredList[index].name!,
                        messageText: filteredList[index].messageText!,
                        imageUrl: filteredList[index].imageURL!,
                        time: filteredList[index].time!,
                        isMessageRead: (index == 0 || index == 3)?true:false,
                      );
                    },
                  ),
                ]
            )
        );
      }
    );
  }
}