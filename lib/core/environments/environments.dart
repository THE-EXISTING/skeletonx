export 'dev_evn.dart';
export 'prod_evn.dart';
export 'uat_evn.dart';

abstract class Environment {
  abstract final String appName;
  abstract final String baseUrl;
  abstract final String deepLink;

  String baseSocketUrl = '';
}
