import 'package:skeletonx/core/core.dart';

class RefreshTokenExpiredException extends Network5XXException {
  static const name = 'REFRESH_TOKEN_EXPIRED';

  const RefreshTokenExpiredException({String? message})
      : super(
          service: RefreshTokenExpiredException.name,
          code: 500,
          message: message,
        );
}
