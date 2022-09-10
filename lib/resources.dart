import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primarySwatch = Color(0xFF2F4D7D);
  static const Color backgroundColor = Color(0xFF2F6D3D);
}

class DesignConstants {
  static const double designWidth = 375;
  static const double designHeight = 812;
}

class AuthConfigStrings {
  static const String appleClientId = "";
  static const String appleReturnUrl = "";
  static const String appleProvider = "apple.com";
}

class AuthErrorStrings {
  static const String canceled = "Operation Canceled";
  static const String alreadyRegistered = "The email you entered is duplicate";
  static const String wrongCredentials = "Wrong credentials entered";
  static const String unknownError = "General Error";
  static const String emailUnverified = "Your email is unverified";
  static const String noRecord = "No user found";
}

class Locales {
  static const Map<String, String> appLocales = {
    "en": "US",
  };
}
