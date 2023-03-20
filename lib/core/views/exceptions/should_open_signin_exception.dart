import 'package:skeletonx/core/core.dart';

class ShouldOpenSignInException extends ViewException {
  ShouldOpenSignInException({required String message})
      : super(message: message);

  @override
  String toString() {
    return 'ShouldOpenSignInException{message: $message}';
  }
}
