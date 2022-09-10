// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'default_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DefaultEntity _$DefaultEntityFromJson(Map<String, dynamic> json) {
  return _DefaultEntity.fromJson(json);
}

/// @nodoc
class _$DefaultEntityTearOff {
  const _$DefaultEntityTearOff();

  _DefaultEntity call(
      {String? id,
      required String fieldName1,
      bool fieldName2 = false,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson)
          DateTime? fieldName3,
      @JsonKey(ignore: true)
          Uint8List? fieldName4}) {
    return _DefaultEntity(
      id: id,
      fieldName1: fieldName1,
      fieldName2: fieldName2,
      fieldName3: fieldName3,
      fieldName4: fieldName4,
    );
  }

  DefaultEntity fromJson(Map<String, Object> json) {
    return DefaultEntity.fromJson(json);
  }
}

/// @nodoc
const $DefaultEntity = _$DefaultEntityTearOff();

/// @nodoc
mixin _$DefaultEntity {
  String? get id => throw _privateConstructorUsedError;
  String get fieldName1 => throw _privateConstructorUsedError;
  bool get fieldName2 => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson)
  DateTime? get fieldName3 => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Uint8List? get fieldName4 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultEntityCopyWith<DefaultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultEntityCopyWith<$Res> {
  factory $DefaultEntityCopyWith(
          DefaultEntity value, $Res Function(DefaultEntity) then) =
      _$DefaultEntityCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String fieldName1,
      bool fieldName2,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson)
          DateTime? fieldName3,
      @JsonKey(ignore: true)
          Uint8List? fieldName4});
}

/// @nodoc
class _$DefaultEntityCopyWithImpl<$Res>
    implements $DefaultEntityCopyWith<$Res> {
  _$DefaultEntityCopyWithImpl(this._value, this._then);

  final DefaultEntity _value;
  // ignore: unused_field
  final $Res Function(DefaultEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? fieldName1 = freezed,
    Object? fieldName2 = freezed,
    Object? fieldName3 = freezed,
    Object? fieldName4 = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldName1: fieldName1 == freezed
          ? _value.fieldName1
          : fieldName1 // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName2: fieldName2 == freezed
          ? _value.fieldName2
          : fieldName2 // ignore: cast_nullable_to_non_nullable
              as bool,
      fieldName3: fieldName3 == freezed
          ? _value.fieldName3
          : fieldName3 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fieldName4: fieldName4 == freezed
          ? _value.fieldName4
          : fieldName4 // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
abstract class _$DefaultEntityCopyWith<$Res>
    implements $DefaultEntityCopyWith<$Res> {
  factory _$DefaultEntityCopyWith(
          _DefaultEntity value, $Res Function(_DefaultEntity) then) =
      __$DefaultEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String fieldName1,
      bool fieldName2,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson)
          DateTime? fieldName3,
      @JsonKey(ignore: true)
          Uint8List? fieldName4});
}

/// @nodoc
class __$DefaultEntityCopyWithImpl<$Res>
    extends _$DefaultEntityCopyWithImpl<$Res>
    implements _$DefaultEntityCopyWith<$Res> {
  __$DefaultEntityCopyWithImpl(
      _DefaultEntity _value, $Res Function(_DefaultEntity) _then)
      : super(_value, (v) => _then(v as _DefaultEntity));

  @override
  _DefaultEntity get _value => super._value as _DefaultEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? fieldName1 = freezed,
    Object? fieldName2 = freezed,
    Object? fieldName3 = freezed,
    Object? fieldName4 = freezed,
  }) {
    return _then(_DefaultEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldName1: fieldName1 == freezed
          ? _value.fieldName1
          : fieldName1 // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName2: fieldName2 == freezed
          ? _value.fieldName2
          : fieldName2 // ignore: cast_nullable_to_non_nullable
              as bool,
      fieldName3: fieldName3 == freezed
          ? _value.fieldName3
          : fieldName3 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fieldName4: fieldName4 == freezed
          ? _value.fieldName4
          : fieldName4 // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DefaultEntity extends _DefaultEntity with DiagnosticableTreeMixin {
  const _$_DefaultEntity(
      {this.id,
      required this.fieldName1,
      this.fieldName2 = false,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson)
          this.fieldName3,
      @JsonKey(ignore: true)
          this.fieldName4})
      : super._();

  factory _$_DefaultEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_DefaultEntityFromJson(json);

  @override
  final String? id;
  @override
  final String fieldName1;
  @JsonKey(defaultValue: false)
  @override
  final bool fieldName2;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson)
  final DateTime? fieldName3;
  @override
  @JsonKey(ignore: true)
  final Uint8List? fieldName4;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DefaultEntity(id: $id, fieldName1: $fieldName1, fieldName2: $fieldName2, fieldName3: $fieldName3, fieldName4: $fieldName4)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DefaultEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fieldName1', fieldName1))
      ..add(DiagnosticsProperty('fieldName2', fieldName2))
      ..add(DiagnosticsProperty('fieldName3', fieldName3))
      ..add(DiagnosticsProperty('fieldName4', fieldName4));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DefaultEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.fieldName1, fieldName1) ||
                const DeepCollectionEquality()
                    .equals(other.fieldName1, fieldName1)) &&
            (identical(other.fieldName2, fieldName2) ||
                const DeepCollectionEquality()
                    .equals(other.fieldName2, fieldName2)) &&
            (identical(other.fieldName3, fieldName3) ||
                const DeepCollectionEquality()
                    .equals(other.fieldName3, fieldName3)) &&
            (identical(other.fieldName4, fieldName4) ||
                const DeepCollectionEquality()
                    .equals(other.fieldName4, fieldName4)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(fieldName1) ^
      const DeepCollectionEquality().hash(fieldName2) ^
      const DeepCollectionEquality().hash(fieldName3) ^
      const DeepCollectionEquality().hash(fieldName4);

  @JsonKey(ignore: true)
  @override
  _$DefaultEntityCopyWith<_DefaultEntity> get copyWith =>
      __$DefaultEntityCopyWithImpl<_DefaultEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DefaultEntityToJson(this);
  }
}

abstract class _DefaultEntity extends DefaultEntity {
  const factory _DefaultEntity(
      {String? id,
      required String fieldName1,
      bool fieldName2,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson)
          DateTime? fieldName3,
      @JsonKey(ignore: true)
          Uint8List? fieldName4}) = _$_DefaultEntity;
  const _DefaultEntity._() : super._();

  factory _DefaultEntity.fromJson(Map<String, dynamic> json) =
      _$_DefaultEntity.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get fieldName1 => throw _privateConstructorUsedError;
  @override
  bool get fieldName2 => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimetoJson)
  DateTime? get fieldName3 => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Uint8List? get fieldName4 => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultEntityCopyWith<_DefaultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
