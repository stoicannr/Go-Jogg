import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_flutter/screens/authentication/reset_password_screen.dart';
import 'package:starter_flutter/screens/chat/chat_screen.dart';

class PersonCard extends StatefulWidget{
  final String namePerson;

  const PersonCard({
    Key? key,
    required this.namePerson
  }) : super(key: key);



  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {

  double _width = 292.w;
  double _height = 166.h;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        width: _width,
        height: selected ? 166 : 64,
        duration: const Duration(seconds: 1),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 8.w,right: 8.w, top: 8.h ,bottom: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20.w,
                      backgroundColor: Colors.grey,

                    ),
                    Text(
                        widget.namePerson,
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    )

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("sfjasjfa"),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: SizedBox(
                        width: 70.w,
                        height: 70.h,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: IconButton(
                            icon: Icon(Icons.message),
                            onPressed: (){
                              setState(() {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ChatScreen()));
                              });
                            },
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          color: Color(0xFF241C1C),
                          splashColor: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}