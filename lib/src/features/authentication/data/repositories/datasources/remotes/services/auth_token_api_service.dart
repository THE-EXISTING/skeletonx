// ignore_for_file: non_constant_identifier_names
import 'package:skeletonx/core/core.dart';

class AuthTokenApiService extends AppApiService {
  static const REGIS_OR_LOGIN_ENDPOINT = '/v1/auth/mobile';
  static const CONFIRM_OTP_ENDPOINT = '/v1/auth/mobile/confirmOtp';
  static const REQUEST_OTP_AGAIN_ENDPOINT = '/v1/auth/mobile/requestOtp';

  static REVOKE_ENDPOINT(String token) => 'v1/auth/revoke/$token';

  AuthTokenApiService();

  Future<Response<LoginOrRegisResponse>> signInOrRegisterWithMobile(
          {required LoginOrRegisterBody body}) async =>
      await post(REGIS_OR_LOGIN_ENDPOINT,
          data: body,
          converter: (json) => LoginOrRegisResponse.fromJson(json),
          isUseToken: false);

  Future<Response<ConfirmOTPResponse>> confirmOTP(
          {required ConfirmOTPBody body}) async =>
      await post(CONFIRM_OTP_ENDPOINT,
          data: body,
          converter: (json) => ConfirmOTPResponse.fromJson(json),
          isUseToken: false);

  Future<Response<LoginOrRegisResponse>> requestOTPAgain(
          {required LoginOrRegisterBody body}) async =>
      await post(REQUEST_OTP_AGAIN_ENDPOINT,
          data: body,
          converter: (json) => LoginOrRegisResponse.fromJson(json),
          isUseToken: false);

  Future<Response<RefreshTokenResponse>> refreshToken(
          {required RefreshTokenBody body}) async =>
      await post(AppConfig.refreshTokenPath,
          data: body,
          converter: (json) => RefreshTokenResponse.fromJson(json),
          isUseToken: false);

  Future<Response<bool>> revokeSession({required String token}) async =>
      await delete(
        REVOKE_ENDPOINT(token),
        converter: (json) => true,
        isUseToken: false,
      );
}
