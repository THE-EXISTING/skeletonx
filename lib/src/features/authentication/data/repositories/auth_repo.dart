import 'package:skeletonx/core/core.dart';

class AuthRepository {
  AuthRepository({
    AuthRemoteDataSources? authRemote,
    AuthLocalDataSources? authLocal,
  })  : _authRemote = authRemote ?? AuthRemoteDataSources(),
        _authLocal = authLocal ?? AuthLocalDataSources();

  final AuthRemoteDataSources _authRemote;
  final AuthLocalDataSources _authLocal;

  Future<bool> isSignIn() async {
    TokenModel token = await _authLocal.loadToken();
    _authRemote.setupToken(token);
    return token.isNotEmptyToken;
  }

  Stream<Resource<LoginModel>> signInWithMobile({required String number}) =>
      NetworkBoundResource.asStream<LoginModel, LoginOrRegisResponse>(
        createCallFuture: () => _authRemote.signInWithMobile(number),
        processResponse: (response) => LoginModel.fromResponse(response),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<bool>> confirmOtp({
    required String otp,
    required String token,
  }) =>
      NetworkBoundResource.asStream<bool, ConfirmOTPResponse>(
        createCallFuture: () => _authRemote.confirmOtp(otp, token),
        processResponse: (response) async {
          final token = TokenModel.fromResponse(response);
          _authRemote.setupToken(token);
          await _authLocal.saveToken(token: token);
          return true;
        },
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<LoginModel>> requestOtpAgain({required String number}) =>
      NetworkBoundResource.asStream<LoginModel, LoginOrRegisResponse>(
        createCallFuture: () => _authRemote.requestOtpAgain(number),
        processResponse: (response) => LoginModel.fromResponse(response),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<bool>> signOut() => NetworkBoundResource.asStream<bool, bool>(
        createCallFuture: () async {
          TokenModel token = await _authLocal.loadToken();
          return _authRemote.signOut(token.accessToken);
        },
        saveCallResult: (model) async {
          _authRemote.clearToken();
          await _authLocal.deleteCredential();
        },
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );
}
