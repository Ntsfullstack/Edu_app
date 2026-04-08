import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/repositories/auth_repository/exceptions.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/pages/login/cubit/login_cubit.dart';
import 'package:flutter_starter/presenter/pages/login/cubit/login_state.dart';

class AppBlocObserver extends BlocObserver {
  final AuthCubit _authCubit;

  const AppBlocObserver(this._authCubit);

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (bloc is LoginCubit && change is Change<LoginState>) {
      _onLoginCubitChanged(bloc, change);
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (error is UnauthorizedException) {
      _authCubit.loggedOut();
    }

    super.onError(bloc, error, stackTrace);
  }

  void _onLoginCubitChanged(LoginCubit bloc, Change<LoginState> change) {
    if (change.nextState.status == LoginStatus.success &&
        change.nextState.account != null) {
      _authCubit.loggedIn(change.nextState.account!);
    }
  }
}
