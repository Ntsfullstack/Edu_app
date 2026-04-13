// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterState {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  UserRole get selectedRole => throw _privateConstructorUsedError;
  RegisterStatus get status => throw _privateConstructorUsedError;
  RegisterResponse? get registerResponse => throw _privateConstructorUsedError;
  BaseException<dynamic>? get error => throw _privateConstructorUsedError;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {String name,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword,
      UserRole selectedRole,
      RegisterStatus status,
      RegisterResponse? registerResponse,
      BaseException<dynamic>? error});

  $RegisterResponseCopyWith<$Res>? get registerResponse;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? selectedRole = null,
    Object? status = null,
    Object? registerResponse = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRole: null == selectedRole
          ? _value.selectedRole
          : selectedRole // ignore: cast_nullable_to_non_nullable
              as UserRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      registerResponse: freezed == registerResponse
          ? _value.registerResponse
          : registerResponse // ignore: cast_nullable_to_non_nullable
              as RegisterResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ) as $Val);
  }

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegisterResponseCopyWith<$Res>? get registerResponse {
    if (_value.registerResponse == null) {
      return null;
    }

    return $RegisterResponseCopyWith<$Res>(_value.registerResponse!, (value) {
      return _then(_value.copyWith(registerResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
          _$RegisterStateImpl value, $Res Function(_$RegisterStateImpl) then) =
      __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword,
      UserRole selectedRole,
      RegisterStatus status,
      RegisterResponse? registerResponse,
      BaseException<dynamic>? error});

  @override
  $RegisterResponseCopyWith<$Res>? get registerResponse;
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
      _$RegisterStateImpl _value, $Res Function(_$RegisterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? selectedRole = null,
    Object? status = null,
    Object? registerResponse = freezed,
    Object? error = freezed,
  }) {
    return _then(_$RegisterStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      selectedRole: null == selectedRole
          ? _value.selectedRole
          : selectedRole // ignore: cast_nullable_to_non_nullable
              as UserRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      registerResponse: freezed == registerResponse
          ? _value.registerResponse
          : registerResponse // ignore: cast_nullable_to_non_nullable
              as RegisterResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$RegisterStateImpl implements _RegisterState {
  const _$RegisterStateImpl(
      {this.name = '',
      this.email = '',
      this.phoneNumber = '',
      this.password = '',
      this.confirmPassword = '',
      this.selectedRole = UserRole.teacher,
      this.status = RegisterStatus.initial,
      this.registerResponse,
      this.error});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final UserRole selectedRole;
  @override
  @JsonKey()
  final RegisterStatus status;
  @override
  final RegisterResponse? registerResponse;
  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'RegisterState(name: $name, email: $email, phoneNumber: $phoneNumber, password: $password, confirmPassword: $confirmPassword, selectedRole: $selectedRole, status: $status, registerResponse: $registerResponse, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.selectedRole, selectedRole) ||
                other.selectedRole == selectedRole) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.registerResponse, registerResponse) ||
                other.registerResponse == registerResponse) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, phoneNumber,
      password, confirmPassword, selectedRole, status, registerResponse, error);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
      {final String name,
      final String email,
      final String phoneNumber,
      final String password,
      final String confirmPassword,
      final UserRole selectedRole,
      final RegisterStatus status,
      final RegisterResponse? registerResponse,
      final BaseException<dynamic>? error}) = _$RegisterStateImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  UserRole get selectedRole;
  @override
  RegisterStatus get status;
  @override
  RegisterResponse? get registerResponse;
  @override
  BaseException<dynamic>? get error;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
