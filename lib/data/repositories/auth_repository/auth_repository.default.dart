import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/entities/request/login_params.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter_starter/data/repositories/auth_repository/exceptions.dart';
import 'package:flutter_starter/data/sources/network/network.dart';

@Singleton(as: AuthRepository)
class DefaultAuthRepository extends AuthRepository {
  final NetworkDataSource _networkDataSource;

  DefaultAuthRepository({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Future<Account> verifyLoginStatus() async {
    try {
      return await _networkDataSource.getCurrentAccount();
    } catch (e) {
      throw UnauthorizedException();
    }
  }

  @override
  Future<Account> login({
    required String username,
    required String password,
  }) async {
    try {
      final account = await _networkDataSource.login(LoginParams(
        username: username,
        password: password,
      ));

      return account;
    } on DioException {
      throw LoginInvalidEmailPasswordException();
    }
  }

  @override
  Future<RegisterResponse> register({
    required RegisterParams params,
  }) async {
    try {
      return await _networkDataSource.register(params);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 409) {
        throw EmailAlreadyExistsException();
      }
      throw RegisterFailedException();
    }
  }
}
