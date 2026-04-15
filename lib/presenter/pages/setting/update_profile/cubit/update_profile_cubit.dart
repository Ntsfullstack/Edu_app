import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/request/update_profile_params.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:injectable/injectable.dart';

import 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final AuthRepository _authRepository;
  final AuthCubit _authCubit;

  UpdateProfileCubit(
    this._authRepository,
    this._authCubit,
  ) : super(const UpdateProfileState());

  Future<void> updateProfile({
    String? name,
    String? phoneNumber,
    String? avatar,
  }) async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));

    try {
      await _authRepository.updateProfile(
        params: UpdateProfileParams(
          name: name,
          phoneNumber: phoneNumber,
        ),
      );

      // Refresh global Auth state to reflect changes across the app
      await _authCubit.verifyLoginStatus();
      
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
