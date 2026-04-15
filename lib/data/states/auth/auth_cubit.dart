import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_state.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter_starter/data/repositories/auth_repository/exceptions.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState());

  void loggedIn(Account account) {
    emit(state.copyWith(
      account: account,
      error: null,
    ));
  }

  Future<void> verifyLoginStatus() async {
    try {
      final account = await _authRepository.verifyLoginStatus();
      loggedIn(account);
    } catch (e) {
      if (e is UnauthorizedException) {
        await loggedOut(e);
      }
    }
  }

  Future<void> loggedOut([BaseException? error]) async {
    await _authRepository.logout();
    emit(state.copyWith(
      account: null,
      error: error,
    ));
  }
}
