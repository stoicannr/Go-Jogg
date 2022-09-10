import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:starter_flutter/utils/json.dart';

/// name of the file.freezed.dart
part 'default_entity.freezed.dart';

/// name of the file.g.dart
part 'default_entity.g.dart';


///  run the command below after any freezed modification
///
///  flutter packages pub run build_runner watch --delete-conflicting-outputs
///
///  Remember that you need to manually add the part files every time

@freezed
abstract class DefaultEntity implements _$DefaultEntity {
  const factory DefaultEntity({
    String? id,
    required String fieldName1,
    @Default(false) bool fieldName2,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson) DateTime? fieldName3,
    @JsonKey(ignore: true) Uint8List? fieldName4,
  }) = _DefaultEntity;

  const DefaultEntity._();

  factory DefaultEntity.fromJson(Map<String, dynamic> json) => _$DefaultEntityFromJson(json);

  factory DefaultEntity.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return DefaultEntity.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}