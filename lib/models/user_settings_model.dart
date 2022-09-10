import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_flutter/db/user_settings_database.dart';

final String tableUserSettings = "userSettings";

class UserSettingsFields{

  static final List<String> values = [
    id,sex,age,distance,location1,location2,location3,darkMode,incognitoMode
  ];


  static final String id = '_id';
  static final String sex = 'sex';
  static final String age = 'age';
  static final String distance = 'distance';
  static final String location1 = 'location1';
  static final String location2 = 'location2';
  static final String location3 = 'location3';
  static final String darkMode = 'darkMode';
  static final String incognitoMode = 'incognitoMode';


}
class UserSettings {
  const UserSettings({
    this.id,
    this.sex,
    this.age,
    this.distance,
    this.location1,
    this.location2,
    this.location3,
    required this.darkMode,
    required this.incognitoMode
});

  final int? id;
  final String? sex;
  final String? age;
  final String? distance;
  final String? location1,location2,location3;
  final bool darkMode;
  final bool incognitoMode;

  static UserSettings fromJson(Map<String, Object?> json) => UserSettings(
    id: json[UserSettingsFields.id] as int?,
      sex: json[UserSettingsFields.sex] as String?,
      age: json[UserSettingsFields.age] as String?,
      distance: json[UserSettingsFields.distance] as String?,
      location1: json[UserSettingsFields.location1] as String?,
      location2: json[UserSettingsFields.location2] as String?,
      location3: json[UserSettingsFields.location3] as String?,
      darkMode: json[UserSettingsFields.darkMode] == 1,
      incognitoMode: json[UserSettingsFields.incognitoMode] == 1
  );

  Map<String, Object?> toJson() => {

    UserSettingsFields.id: id,
    UserSettingsFields.sex: sex,
    UserSettingsFields.age: age,
    UserSettingsFields.distance: distance,
    UserSettingsFields.location1: location1,
    UserSettingsFields.location2: location2,
    UserSettingsFields.location3: location3,
    UserSettingsFields.darkMode: darkMode ? 1 : 0,
    UserSettingsFields.incognitoMode: incognitoMode ? 1 : 0,
  };

  UserSettings copy({
  int? id,
    bool? darkMode,
    bool? incognitoMode,
    String? sex,
    String? age,
    String? distance,
    String? location1,
    String? location2,
    String? location3,


}) => UserSettings(
    id: id ?? this.id,
    darkMode: darkMode ?? this.darkMode,
    incognitoMode: incognitoMode ?? this.incognitoMode,
    age: age ?? this.age,
    distance: distance ?? this.distance,
    sex: sex ?? this.sex,
    location1: location1 ?? this.location1,
    location2: location2 ?? this.location2,
    location3: location3 ?? this.location3
  );


}