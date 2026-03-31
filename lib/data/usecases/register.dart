import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';

typedef RegisterUseCaseParams = ({
  String name,
  String email,
  String password,
  String role,
});

@singleton
class RegisterUseCase extends UseCase<RegisterResponse, RegisterUseCaseParams> {
  final AuthRepository _authRepository;

  const RegisterUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  FutureOr<RegisterResponse> call(RegisterUseCaseParams params) {
    return _authRepository.register(
      params: RegisterParams(
        name: params.name,
        email: params.email,
        password: params.password,
        role: params.role,
      ),
    );
  }
}
