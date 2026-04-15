import 'package:dio/dio.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';

abstract class BaseException<T> extends DioException implements Exception {
  @override
  // ignore: overridden_fields
  final String message;
  final String? code;
  final T? data;

  BaseException(
    this.message, {
    this.code,
    this.data,
    super.response,
    super.stackTrace,
    super.type,
    RequestOptions? requestOptions,
  }) : super(
          message: message,
          error: data,
          requestOptions: requestOptions ?? RequestOptions(path: ''),
        );

  static String? extractMessage(Object? error) {
    if (error is DioException) {
      final responseData = error.response?.data;
      if (responseData is Map && responseData.containsKey('message')) {
        return responseData['message'].toString();
      }
    }
    return null;
  }

  static BaseException from(Object? error) {
    if (error is BaseException) return error;
    final serverMessage = extractMessage(error);
    if (serverMessage != null && error is DioException) {
      return ServerException(
        serverMessage,
        response: error.response,
      );
    }
    return UnknownException(error);
  }

  @override
  String toString() {
    return '$runtimeType'
        '('
        'message: $message'
        '${code != null ? ', code: $code' : ''}'
        '${data != null ? ', data: $data' : ''}'
        ')';
  }
}

class UnknownException extends BaseException {
  UnknownException([Object? error]) : super(LocaleKeys.Errors_AnUnknownErrorOccurred, data: error);
}

class NetworkException extends BaseException {
  NetworkException() : super(LocaleKeys.Errors_NetworkError);
}

class ServerException extends BaseException {
  ServerException(String message, {super.response}) : super(message);
}
