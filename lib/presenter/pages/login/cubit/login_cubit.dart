import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/usecases/login.dart';
import 'package:flutter_starter/presenter/pages/login/cubit/login_state.dart';
import 'package:flutter_starter/core/exception.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _login;

  LoginCubit({
    required LoginUseCase login,
  })  : _login = login,
        super(const LoginState());

  void emailChanged(String email) {
    emit(state.copyWith(email: email, status: LoginStatus.initial));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, status: LoginStatus.initial));
  }

  Future<void> login() async {
    emit(state.copyWith(status: LoginStatus.submitting));

    try {
      final account = await _login((
        email: state.email,
        password: state.password,
      ));

      emit(state.copyWith(
        status: LoginStatus.success,
        account: account,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        error: BaseException.from(e),
      ));
    }
  }
}
