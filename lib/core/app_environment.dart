import 'package:skeletonx/core/core.dart';

class AppEnvironment {
  factory AppEnvironment() => instance;

  AppEnvironment._();

  static final AppEnvironment instance = AppEnvironment._();

  static const String dev = 'DEV';
  static const String uat = 'UAT';
  static const String prod = 'PROD';

  final Environment _devEvn = DevEnvironment();
  final Environment _uatEvn = UATEnvironment();
  final Environment _prodEvn = ProdEnvironment();

  final String _environment = const String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: AppEnvironment.dev,
  );

  Environment get environment {
    switch (_environment) {
      case AppEnvironment.dev:
        return _devEvn;
      case AppEnvironment.uat:
        return _uatEvn;
      case AppEnvironment.prod:
        return _prodEvn;
      default:
        throw UnimplementedError();
    }
  }

  String get appName => environment.appName;

  String get baseUrl => environment.baseUrl;

  String get deeplink => environment.deepLink;
}
