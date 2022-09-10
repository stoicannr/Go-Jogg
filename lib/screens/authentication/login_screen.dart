import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_flutter/screens/shared_elements/login_container.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginContainer(
          title: "Log In",
          text1: "Log In",
          text2: "Sign Up",

        )
      ),
    );
  }
}