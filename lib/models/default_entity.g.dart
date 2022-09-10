// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DefaultEntity _$_$_DefaultEntityFromJson(Map<String, dynamic> json) {
  return _$_DefaultEntity(
    id: json['id'] as String?,
    fieldName1: json['fieldName1'] as String,
    fieldName2: json['fieldName2'] as bool? ?? false,
    fieldName3: dateTimeFromJson(json['fieldName3']),
  );
}

Map<String, dynamic> _$_$_DefaultEntityToJson(_$_DefaultEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fieldName1': instance.fieldName1,
      'fieldName2': instance.fieldName2,
      'fieldName3': dateTimetoJson(instance.fieldName3),
    };
