import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/entities/user_role.dart';
import 'package:flutter_starter/data/usecases/register.dart';
import 'package:flutter_starter/presenter/pages/register/cubit/register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _register;

  RegisterCubit({required RegisterUseCase register})
      : _register = register,
        super(const RegisterState());

  void nameChanged(String name) {
    emit(state.copyWith(name: name, status: RegisterStatus.initial));
  }

  void emailChanged(String email) {
    emit(state.copyWith(email: email, status: RegisterStatus.initial));
  }

  void phoneNumberChanged(String phone) {
    emit(state.copyWith(phoneNumber: phone, status: RegisterStatus.initial));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, status: RegisterStatus.initial));
  }

  void confirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      status: RegisterStatus.initial,
    ));
  }

  void roleChanged(UserRole role) {
    emit(state.copyWith(selectedRole: role));
  }

  Future<void> register() async {
    if (state.password != state.confirmPassword) {
      emit(state.copyWith(
        status: RegisterStatus.failure,
        error: BaseException.from(
          Exception('Passwords do not match'),
        ),
      ));
      return;
    }

    emit(state.copyWith(status: RegisterStatus.submitting));

    try {
      final response = await _register((
        name: state.name,
        email: state.email,
        phoneNumber: state.phoneNumber,
        password: state.password,
        role: 'parent',
      ));

      emit(state.copyWith(
        status: RegisterStatus.success,
        registerResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: RegisterStatus.failure,
        error: BaseException.from(e),
      ));
    }
  }
}
