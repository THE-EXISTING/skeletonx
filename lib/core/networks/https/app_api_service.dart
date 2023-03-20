import 'package:skeletonx/core/core.dart';

abstract class AppApiService implements RequestApiService {
  AppHttpClient get _client => MyApplication.httpClient;

  bool isSignIn() => _client.hasAccessToken && _client.hasRefreshAccessToken;

  void setupAccessToken(String token) {
    _client.setupAccessToken(token);
  }

  void setupRefreshToken(String token) {
    _client.setupRefreshToken(token);
  }

  void clearToken() {
    _client.clearToken();
  }

  @override
  Future<Response<T>> get<T>(
    String endPoint, {
    Map<String, Object>? queryParameters,
    Options? options,
    bool isUseToken = true,
    required FutureOr<T> Function(Map<String, dynamic> json) converter,
    T? Function(DioError exception, StackTrace? stackTrace)? catchError,
  }) =>
      _client.get(
        endPoint,
        queryParameters: queryParameters,
        options: options,
        converter: converter,
        catchError: catchError,
        isUseToken: isUseToken,
      );

  @override
  Future<Response<T>> post<T>(
    String endPoint, {
    RequestBodyX? data,
    Options? options,
    bool isUseToken = true,
    Map<String, Object>? queryParameters,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioError exception, StackTrace? stackTrace)? catchError,
  }) =>
      _client.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        converter: converter,
        catchError: catchError,
        isUseToken: isUseToken,
      );

  @override
  Future<Response<T>> postFormData<T>(
    String endPoint, {
    FormData? data,
    Options? options,
    bool isUseToken = true,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioError exception, StackTrace? stackTrace)? catchError,
  }) =>
      _client.postFormData(
        endPoint,
        data: data,
        options: options,
        converter: converter,
        catchError: catchError,
        isUseToken: isUseToken,
      );

  @override
  Future<Response<T>> put<T>(
    String endPoint, {
    RequestBodyX? data,
    Options? options,
    bool isUseToken = true,
    Map<String, Object>? queryParameters,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioError exception, StackTrace? stackTrace)? catchError,
  }) =>
      _client.put(
        endPoint,
        data: data,
        options: options,
        converter: converter,
        catchError: catchError,
        isUseToken: isUseToken,
        queryParameters: queryParameters,
      );

  @override
  Future<Response<T>> putFormData<T>(
    String endPoint, {
    FormData? data,
    Options? options,
    bool isUseToken = true,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioError exception, StackTrace? stackTrace)? catchError,
  }) =>
      _client.putFormData(
        endPoint,
        data: data,
        options: options,
        converter: converter,
        catchError: catchError,
        isUseToken: isUseToken,
      );

  @override
  Future<Response<T>> delete<T>(
    String endPoint, {
    RequestBodyX? data,
    Map<String, Object>? queryParameters,
    Options? options,
    bool isUseToken = true,
    required T Function(Map<String, dynamic> json) converter,
    T? Function(DioError exception, StackTrace? stackTrace)? catchError,
  }) =>
      _client.delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        converter: converter,
        catchError: catchError,
        isUseToken: isUseToken,
      );
}
