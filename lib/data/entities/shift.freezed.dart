// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return _Shift.fromJson(json);
}

/// @nodoc
mixin _$Shift {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Shift to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftCopyWith<Shift> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftCopyWith<$Res> {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) then) =
      _$ShiftCopyWithImpl<$Res, Shift>;
  @useResult
  $Res call(
      {String id,
      String name,
      String startTime,
      String endTime,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ShiftCopyWithImpl<$Res, $Val extends Shift>
    implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftImplCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$$ShiftImplCopyWith(
          _$ShiftImpl value, $Res Function(_$ShiftImpl) then) =
      __$$ShiftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String startTime,
      String endTime,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ShiftImplCopyWithImpl<$Res>
    extends _$ShiftCopyWithImpl<$Res, _$ShiftImpl>
    implements _$$ShiftImplCopyWith<$Res> {
  __$$ShiftImplCopyWithImpl(
      _$ShiftImpl _value, $Res Function(_$ShiftImpl) _then)
      : super(_value, _then);

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ShiftImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$ShiftImpl implements _Shift {
  const _$ShiftImpl(
      {required this.id,
      required this.name,
      required this.startTime,
      required this.endTime,
      this.createdAt,
      this.updatedAt});

  factory _$ShiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Shift(id: $id, name: $name, startTime: $startTime, endTime: $endTime, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, startTime, endTime, createdAt, updatedAt);

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      __$$ShiftImplCopyWithImpl<_$ShiftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftImplToJson(
      this,
    );
  }
}

abstract class _Shift implements Shift {
  const factory _Shift(
      {required final String id,
      required final String name,
      required final String startTime,
      required final String endTime,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ShiftImpl;

  factory _Shift.fromJson(Map<String, dynamic> json) = _$ShiftImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
