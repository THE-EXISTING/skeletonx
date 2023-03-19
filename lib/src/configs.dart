import 'package:skeletonx/core/core.dart';

class AppConfig {
  ///========================= NETWORK CONFIGS =========================///
  static String get apiBaseUrl => AppEnvironment.instance.baseUrl;

  static String get socketBaseUrl => AppEnvironment.instance.baseUrl;

  static const String refreshTokenPath = 'api/auth/refresh';
  static const Duration timeout = Duration(microseconds: 20000);
}
