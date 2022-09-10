import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_flutter/screens/authentication/login_screen.dart';
import 'package:starter_flutter/screens/home/home_screen.dart';

class ResetPasswordScreen extends StatefulWidget{
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = new TextEditingController();
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen()));},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Succes"),
      content: Text("Password Reset Email Sent"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
                    child: Image(
                      image: AssetImage("assets/images/go&jog.png"),
                    ),
                  ),
                  Text(
                    "Reset Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36.sp
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 28.h, bottom: 20.h),
                    child: TextField(
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          labelText: "Email"
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 320.w,
                    height: 64.h,
                    child: RaisedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                        showAlertDialog(context);
                      },
                      child: Text(
                        'Request Reset',
                        style: TextStyle(
                            fontSize: 18.sp
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Color(0xFF241C1C),
                      splashColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}