import 'package:skeletonx/core/environments/environments.dart';

class DevEnvironment extends Environment {
  @override
  final String appName = 'Skeleton X (DEV)';

  @override
  final String baseUrl = 'https://www.thecocktaildb.com/';

  @override
  final String deepLink = 'dev.skeletonx';

}
