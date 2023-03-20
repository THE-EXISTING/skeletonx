import 'package:skeletonx/core/core.dart';

class AccessTokenUnauthorizedException extends Network4XXException {
  static const name = 'ACCESS_TOKEN_UNAUTHORIZED';

  const AccessTokenUnauthorizedException()
      : super(
          service: AccessTokenUnauthorizedException.name,
          code: 401,
        );
}
