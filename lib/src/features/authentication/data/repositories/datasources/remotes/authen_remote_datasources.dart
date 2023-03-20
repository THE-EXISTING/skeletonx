import 'package:skeletonx/core/core.dart';

class AuthRemoteDataSources{
  AuthRemoteDataSources({
    UserApiService? userApiService,
    AuthTokenApiService? authTokenApiService,
  }) : _authApiService = authTokenApiService ?? AuthTokenApiService();

  final AuthTokenApiService _authApiService;

  bool isSignIn() => _authApiService.isSignIn();

  void setupToken(TokenModel token) {
    _authApiService.setupAccessToken(token.accessToken);
    _authApiService.setupRefreshToken(token.refreshToken);
  }

  void clearToken() {
    _authApiService.clearToken();
  }

  Future<LoginOrRegisResponse> signInWithMobile(String number) async =>
      await _authApiService
          .signInOrRegisterWithMobile(
              body: LoginOrRegisterBody(mobileNumber: number))
          .unWrapResponse();

  Future<ConfirmOTPResponse> confirmOtp(String otp, String token) async =>
      await _authApiService
          .confirmOTP(body: ConfirmOTPBody(otp: otp, token: token))
          .unWrapResponse();

  Future<LoginOrRegisResponse> requestOtpAgain(String number) async =>
      await _authApiService
          .requestOTPAgain(body: LoginOrRegisterBody(mobileNumber: number))
          .unWrapResponse();

  Future<bool> signOut(String token) async =>
      await _authApiService.revokeSession(token: token).unWrapResponse();
}
