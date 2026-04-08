import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_starter/data/entities/request/login_params.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/response/login_response.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/sources/network/dio.dart';

part 'network.g.dart';

@singleton
@RestApi()
abstract class NetworkDataSource {
  @factoryMethod
  factory NetworkDataSource(NetworkDio dio) = _NetworkDataSource;

  @POST('auth/login')
  Future<LoginResponse> login(@Body() LoginParams params);

  @POST('/users/me')
  Future<Account> getCurrentAccount();

  @POST('/auth/register')
  Future<RegisterResponse> register(@Body() RegisterParams params);
}
