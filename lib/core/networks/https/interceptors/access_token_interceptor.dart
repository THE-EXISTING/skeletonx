import 'package:skeletonx/core/core.dart';
import 'dart:developer' as developer;

class AccessTokenInterceptor extends TokenInterceptorX {
  AccessTokenInterceptor({
    required Dio dio,
    int retryAccessTokenLimit = 3,
    TokenDatabase tokenDatabase = const TokenDatabase(),
  })  : _dio = dio,
        _tokenDatabase = tokenDatabase,
        super(retryAccessTokenLimit: retryAccessTokenLimit);

  final Dio _dio;
  final TokenDatabase _tokenDatabase;

  // Set your fresh token endpoint.
  static const _refreshEndPoint = AppConfig.refreshTokenPath;

  @override
  int get tokenErrorCode => 401;

  @override
  void onHandleTokenResponse(
      Response response, ResponseInterceptorHandler handler) async {
    developer.log('onHandleTokenResponse $response');
    if (retryAccessTokenLimitCounter > 0) {
      final TokenModel token = await _tokenDatabase.loadToken();
      if (token.isRefreshNotEmpty) {
        refreshToken = token.refreshToken;

        final TokenModel? newToken =
            await _requestRefreshToken(refreshToken: refreshToken!);

        //Set token to interceptor
        accessToken = newToken?.accessToken;
        refreshToken = newToken?.refreshToken;

        if (newToken != null) {
          final newResponse =
              await _reCallService(response.requestOptions, newToken);
          handler.resolve(newResponse);
        } else {
          retryAccessTokenLimitCounter--;
          final error = DioError(
              requestOptions: response.requestOptions,
              response: response,
              error: const AccessTokenUnauthorizedException(),
              type: DioErrorType.badResponse,
              message: response.statusMessage);
          handler.reject(error);
        }
      }
    } else {
      final error = DioError(
        requestOptions: response.requestOptions,
        error: ShouldOpenSignInException(message: response.statusMessage ?? ''),
        response: response,
        type: DioErrorType.badResponse,
      );
      handler.reject(error);
    }
  }

  @override
  void onHandleTokenError(DioError err, ErrorInterceptorHandler handler) async {
    developer.log('onHandleTokenError $err');
    if (retryAccessTokenLimitCounter > 0) {
      final TokenModel token = await _tokenDatabase.loadToken();
      if (token.isRefreshNotEmpty) {
        refreshToken = token.refreshToken;

        final TokenModel? newToken =
            await _requestRefreshToken(refreshToken: refreshToken!);

        //Set token to interceptor
        accessToken = newToken?.accessToken;
        refreshToken = newToken?.refreshToken;

        if (newToken != null) {
          final newResponse =
              await _reCallService(err.requestOptions, newToken);
          handler.resolve(newResponse);
        } else {
          retryAccessTokenLimitCounter--;
          handler.reject(err);
        }
      }
    } else {
      handler.reject(err.copyWith(
          error: ShouldOpenSignInException(message: err.message ?? '')));
    }
  }

  Future<TokenModel?> _requestRefreshToken({required String refreshToken}) {
    return _dio
        .post(_refreshEndPoint,
            data: jsonEncode({'refreshToken': refreshToken}))
        .then((value) async {
      if (value.statusCode == 200) {
        final TokenModel token = TokenModel.fromJson(value.data);
        _tokenDatabase.saveToken(token: token);

        return Future.value(token);
      } else if (value.statusCode == 500) {
        Log.e(value);
        return Future.value(null);
      }
    }, onError: (error, stackTrace) {
      Log.e(error, stackTrace);
      return Future.value(null);
    });
  }

  Future<Response> _reCallService(
      RequestOptions requestOptions, TokenModel token) async {
    accessToken = token.accessToken;
    refreshToken = token.refreshToken;

    //set bearer
    requestOptions.setHeaderTokenBearer(token.accessToken);

    //create request with new access token
    final opts =
        Options(method: requestOptions.method, headers: requestOptions.headers);
    return _dio.request(requestOptions.path,
        options: opts,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters);
  }
}
