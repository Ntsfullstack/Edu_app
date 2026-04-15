import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';

abstract class AuthException extends BaseException {
  AuthException({String? message, super.response, super.code, super.data})
      : super(message ?? LocaleKeys.Errors_AnUnknownErrorOccurred);
}

class UnauthorizedException extends AuthException {
  UnauthorizedException({super.message, super.response});
}

class LoginInvalidEmailPasswordException extends AuthException {
  LoginInvalidEmailPasswordException({String? message, super.response})
      : super(message: message ?? LocaleKeys.Errors_InvalidUsernameOrPassword);
}

class RegisterFailedException extends AuthException {
  RegisterFailedException({String? message, super.response})
      : super(message: message ?? LocaleKeys.Errors_AnUnknownErrorOccurred);
}

class EmailAlreadyExistsException extends AuthException {
  EmailAlreadyExistsException({String? message, super.response})
      : super(message: message ?? LocaleKeys.Errors_AnUnknownErrorOccurred);
}

class UpdateProfileFailedException extends AuthException {
  UpdateProfileFailedException({String? message, super.response})
      : super(message: message ?? LocaleKeys.Errors_AnUnknownErrorOccurred);
}
