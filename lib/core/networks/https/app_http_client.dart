import 'package:skeletonx/core/core.dart';

/// Singleton
class AppHttpClient extends HttpClientX {
  AppHttpClient._singleton({required Dio dio}) : super(dio: dio);

  static AppHttpClient instance = AppHttpClient._singleton(dio: Dio());

  @override
  void setupConfig(Dio dio, BaseOptions config) {
    super.setupConfig(dio, config);
    config.connectTimeout = AppConfig.timeout;
    config.receiveTimeout = AppConfig.timeout;
  }

  @override
  void setupInterceptors(Dio dio, Interceptors interceptors) {
    super.setupInterceptors(dio, interceptors);
    interceptors.addAll([
      AccessTokenInterceptor(
        dio: dio,
        retryAccessTokenLimit: 3,
      ), // Should call before another interceptor.
      NetworkErrorHandlerInterceptor(),
      HttpLogInterceptor(), // Add to last
    ]);
  }
}
