import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';

abstract class AuthRepository {
  Future<Account> verifyLoginStatus();

  Future<Account> login({
    required String email,
    required String password,
  });

  Future<RegisterResponse> register({
    required RegisterParams params,
  });
}
