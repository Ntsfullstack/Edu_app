// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TeacherHomeState {
  List<Schedule> get todaySchedules => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  BaseException<dynamic>? get error => throw _privateConstructorUsedError;

  /// Create a copy of TeacherHomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherHomeStateCopyWith<TeacherHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherHomeStateCopyWith<$Res> {
  factory $TeacherHomeStateCopyWith(
          TeacherHomeState value, $Res Function(TeacherHomeState) then) =
      _$TeacherHomeStateCopyWithImpl<$Res, TeacherHomeState>;
  @useResult
  $Res call(
      {List<Schedule> todaySchedules,
      bool isLoading,
      BaseException<dynamic>? error});
}

/// @nodoc
class _$TeacherHomeStateCopyWithImpl<$Res, $Val extends TeacherHomeState>
    implements $TeacherHomeStateCopyWith<$Res> {
  _$TeacherHomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherHomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaySchedules = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      todaySchedules: null == todaySchedules
          ? _value.todaySchedules
          : todaySchedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherHomeStateImplCopyWith<$Res>
    implements $TeacherHomeStateCopyWith<$Res> {
  factory _$$TeacherHomeStateImplCopyWith(_$TeacherHomeStateImpl value,
          $Res Function(_$TeacherHomeStateImpl) then) =
      __$$TeacherHomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Schedule> todaySchedules,
      bool isLoading,
      BaseException<dynamic>? error});
}

/// @nodoc
class __$$TeacherHomeStateImplCopyWithImpl<$Res>
    extends _$TeacherHomeStateCopyWithImpl<$Res, _$TeacherHomeStateImpl>
    implements _$$TeacherHomeStateImplCopyWith<$Res> {
  __$$TeacherHomeStateImplCopyWithImpl(_$TeacherHomeStateImpl _value,
      $Res Function(_$TeacherHomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherHomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaySchedules = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$TeacherHomeStateImpl(
      todaySchedules: null == todaySchedules
          ? _value._todaySchedules
          : todaySchedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$TeacherHomeStateImpl implements _TeacherHomeState {
  const _$TeacherHomeStateImpl(
      {final List<Schedule> todaySchedules = const [],
      this.isLoading = false,
      this.error})
      : _todaySchedules = todaySchedules;

  final List<Schedule> _todaySchedules;
  @override
  @JsonKey()
  List<Schedule> get todaySchedules {
    if (_todaySchedules is EqualUnmodifiableListView) return _todaySchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todaySchedules);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'TeacherHomeState(todaySchedules: $todaySchedules, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherHomeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._todaySchedules, _todaySchedules) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todaySchedules), isLoading, error);

  /// Create a copy of TeacherHomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherHomeStateImplCopyWith<_$TeacherHomeStateImpl> get copyWith =>
      __$$TeacherHomeStateImplCopyWithImpl<_$TeacherHomeStateImpl>(
          this, _$identity);
}

abstract class _TeacherHomeState implements TeacherHomeState {
  const factory _TeacherHomeState(
      {final List<Schedule> todaySchedules,
      final bool isLoading,
      final BaseException<dynamic>? error}) = _$TeacherHomeStateImpl;

  @override
  List<Schedule> get todaySchedules;
  @override
  bool get isLoading;
  @override
  BaseException<dynamic>? get error;

  /// Create a copy of TeacherHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherHomeStateImplCopyWith<_$TeacherHomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
