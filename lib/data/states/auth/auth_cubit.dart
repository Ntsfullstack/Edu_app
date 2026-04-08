import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_state.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/core/exception.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void loggedIn(Account account) {
    emit(state.copyWith(
      account: account,
      error: null,
    ));
  }

  void loggedOut([BaseException? error]) {
    emit(state.copyWith(
      account: null,
      error: error,
    ));
  }
}
