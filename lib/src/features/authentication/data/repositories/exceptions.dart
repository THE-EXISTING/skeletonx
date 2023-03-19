import 'package:skeletonx/core/core.dart';

enum AuthExceptionType {
  NO_ERROR,
}

class AuthShouldShowError extends DataException<AuthExceptionType> {
  AuthShouldShowError._(
      {required AuthExceptionType type, String? message})
      : super(type: type, message: message);

}
