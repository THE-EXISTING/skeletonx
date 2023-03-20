import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class UserApiService extends AppApiService {
  static const URL_ME = 'api/user/me';

  UserApiService();

  Future<Response<UserResponse>> getUser() => get(
        URL_ME,
        converter: (json) => UserResponse.fromJson(json),
        isUseToken: true,
      );
}
