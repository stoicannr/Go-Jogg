import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_flutter/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/screens/starter_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsCard extends StatefulWidget{

  final String settingName;
  final Icon settingIcon;
  final String docId;

  const SettingsCard({
    Key? key,
    required this.settingName,
    required this.settingIcon,
    required this.docId
  }) : super(key: key);

  @override
  _SettingsCardState createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  bool _setting = false;

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    return Align (
      alignment: Alignment.center,
      child: SwitchListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          title: Text(widget.settingName),
          value: _setting,
          onChanged: (bool value) async {
            StarterApp.themeNotifier.value = StarterApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
            var _collectionReference = FirebaseFirestore.instance;
            await _collectionReference.collection("usersData").doc(widget.docId).update({
              'darkMode' : _setting.toString()
            });

            //provider.toggleTheme(value);
            setState(() {
              _setting = value;
            });
          },
          secondary: widget.settingIcon,
      ),
    );
  }
}