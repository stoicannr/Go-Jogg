import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_flutter/screens/authentication/reset_password_screen.dart';
import 'package:starter_flutter/screens/authentication/sign_up_screen.dart';
import 'package:starter_flutter/screens/home/home_screen.dart';
import 'package:starter_flutter/services/authentication/base_authenticator.dart';
import 'package:starter_flutter/services/authentication/firebase_authenticator.dart';
import 'package:starter_flutter/utils/authentication.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

class LoginContainer extends StatefulWidget {
  final String title;
  final String text1, text2;

  LoginContainer({
    Key? key,
    required this.title,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passController = new TextEditingController();
  Map? _userData;
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                ),
                width: 100.w,
                height: 100.h,
                child: const Image(
                  image: AssetImage("assets/images/go&jog.png"),
                ),
              ),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36.sp),
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.h, bottom: 20.h),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Email"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Password"),
                ),
              ),
              SizedBox(
                width: 320.w,
                height: 64.h,
                child: RaisedButton(
                  onPressed: () async {
                    await _auth.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passController.text);
                    var result = emailController.text
                        .substring(0, emailController.text.indexOf("@"));
                    String? uid = _auth.currentUser!.uid;
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (contex) => HomeScreen(
                          profileName: result,
                          uid: uid,
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30..w),
                  ),
                  color: Color(0xFF241C1C),
                  splashColor: Colors.blue,
                  textColor: Colors.white,
                  child: Text(
                    //text1,
                    "Sign Up",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                child: SizedBox(
                  width: 320.w,
                  height: 64.h,
                  child: RaisedButton(
                    onPressed: () async {
                      try {
                        await _auth.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passController.text);
                        final result = emailController.text
                            .substring(0, emailController.text.indexOf("@"));
                        String? uid = _auth.currentUser!.uid;
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (contex) => HomeScreen(
                              profileName: result,
                              uid: uid,
                            ),
                          ),
                        );
                        setState(() {
                          isloading = false;
                        });
                      } on FirebaseAuthException catch (e) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Ops! Login Failed"),
                            content: Text('${e.message}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('Okay'),
                              )
                            ],
                          ),
                        );
                      }
                      setState(() {
                        isloading = false;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Color(0xFFC8C4B7),
                    splashColor: Colors.blue,
                    textColor: Colors.black,
                    child: Text(
                      // text2,
                      "Log In",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                    child: SizedBox(
                      width: 60.w,
                      height: 64.h,
                      child: RaisedButton(
                        onPressed: () async {
                          // var authenticator = context.read(firebaseAuthenticatorProvider).signInSocial(type: SocialType.google);
                          User? user = await Authentication.signInWithGoogle(
                              context: context);
                          // User? user = await authenticator as User?;
                          String uid = user!.uid;
                          if (user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          profileName:
                                              user.displayName as String,
                                          uid: uid,
                                        )));
                          }
                        },
                        child: const Image(
                          image: AssetImage("assets/images/google_logo.png"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.white,
                        splashColor: Colors.blue,
                        textColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
                ),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()));
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 16.sp),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
