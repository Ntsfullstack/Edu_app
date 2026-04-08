import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/data/usecases/verify_login_status.dart';
import 'package:flutter_starter/presenter/pages/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final VerifyLoginStatusUseCase _verifyLoginStatus;
  final AuthCubit _authCubit;

  SplashCubit({
    required VerifyLoginStatusUseCase verifyLoginStatus,
    required AuthCubit authCubit,
  })  : _verifyLoginStatus = verifyLoginStatus,
        _authCubit = authCubit,
        super(const SplashState());

  Future<void> checkLoginStatus() async {
    try {
      // Small delay for splash visibility if needed
      await Future.delayed(const Duration(milliseconds: 500));
      
      final account = await _verifyLoginStatus();
      
      // Explicitly update AuthCubit before emitting success to prevent race condition in Router
      _authCubit.loggedIn(account);
      
      emit(state.copyWith(status: SplashStatus.success, account: account));
    } catch (e) {
      // If error (unauthorized or network), go to login
      emit(state.copyWith(status: SplashStatus.failure));
    }
  }
}
