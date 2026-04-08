import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/usecases/verify_login_status.dart';
import 'package:flutter_starter/presenter/pages/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final VerifyLoginStatusUseCase _verifyLoginStatus;

  SplashCubit({
    required VerifyLoginStatusUseCase verifyLoginStatus,
  })  : _verifyLoginStatus = verifyLoginStatus,
        super(const SplashState());

  Future<void> checkLoginStatus() async {
    try {
      // Small delay for splash visibility if needed
      await Future.delayed(const Duration(milliseconds: 500));
      
      await _verifyLoginStatus();
      
      // If we got an account, we are logged in
      emit(state.copyWith(status: SplashStatus.success));
    } catch (e) {
      // If error (unauthorized or network), go to login
      emit(state.copyWith(status: SplashStatus.failure));
    }
  }
}
