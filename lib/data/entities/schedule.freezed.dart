// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'class')
  ClassEntity get classEntity => throw _privateConstructorUsedError;
  String get classId => throw _privateConstructorUsedError;
  int get weekday => throw _privateConstructorUsedError;
  Shift get shift => throw _privateConstructorUsedError;
  String get shiftId => throw _privateConstructorUsedError;
  Account get teacher => throw _privateConstructorUsedError;
  String get teacherId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'class') ClassEntity classEntity,
      String classId,
      int weekday,
      Shift shift,
      String shiftId,
      Account teacher,
      String teacherId,
      DateTime? createdAt,
      DateTime? updatedAt});

  $ClassEntityCopyWith<$Res> get classEntity;
  $ShiftCopyWith<$Res> get shift;
  $AccountCopyWith<$Res> get teacher;
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? classEntity = null,
    Object? classId = null,
    Object? weekday = null,
    Object? shift = null,
    Object? shiftId = null,
    Object? teacher = null,
    Object? teacherId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      classEntity: null == classEntity
          ? _value.classEntity
          : classEntity // ignore: cast_nullable_to_non_nullable
              as ClassEntity,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as String,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Account,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassEntityCopyWith<$Res> get classEntity {
    return $ClassEntityCopyWith<$Res>(_value.classEntity, (value) {
      return _then(_value.copyWith(classEntity: value) as $Val);
    });
  }

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShiftCopyWith<$Res> get shift {
    return $ShiftCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get teacher {
    return $AccountCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'class') ClassEntity classEntity,
      String classId,
      int weekday,
      Shift shift,
      String shiftId,
      Account teacher,
      String teacherId,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $ClassEntityCopyWith<$Res> get classEntity;
  @override
  $ShiftCopyWith<$Res> get shift;
  @override
  $AccountCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? classEntity = null,
    Object? classId = null,
    Object? weekday = null,
    Object? shift = null,
    Object? shiftId = null,
    Object? teacher = null,
    Object? teacherId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      classEntity: null == classEntity
          ? _value.classEntity
          : classEntity // ignore: cast_nullable_to_non_nullable
              as ClassEntity,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as String,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as Shift,
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Account,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
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
class _$ScheduleImpl implements _Schedule {
  const _$ScheduleImpl(
      {required this.id,
      @JsonKey(name: 'class') required this.classEntity,
      required this.classId,
      required this.weekday,
      required this.shift,
      required this.shiftId,
      required this.teacher,
      required this.teacherId,
      this.createdAt,
      this.updatedAt});

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'class')
  final ClassEntity classEntity;
  @override
  final String classId;
  @override
  final int weekday;
  @override
  final Shift shift;
  @override
  final String shiftId;
  @override
  final Account teacher;
  @override
  final String teacherId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Schedule(id: $id, classEntity: $classEntity, classId: $classId, weekday: $weekday, shift: $shift, shiftId: $shiftId, teacher: $teacher, teacherId: $teacherId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.classEntity, classEntity) ||
                other.classEntity == classEntity) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, classEntity, classId,
      weekday, shift, shiftId, teacher, teacherId, createdAt, updatedAt);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  const factory _Schedule(
      {required final String id,
      @JsonKey(name: 'class') required final ClassEntity classEntity,
      required final String classId,
      required final int weekday,
      required final Shift shift,
      required final String shiftId,
      required final Account teacher,
      required final String teacherId,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ScheduleImpl;

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'class')
  ClassEntity get classEntity;
  @override
  String get classId;
  @override
  int get weekday;
  @override
  Shift get shift;
  @override
  String get shiftId;
  @override
  Account get teacher;
  @override
  String get teacherId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
