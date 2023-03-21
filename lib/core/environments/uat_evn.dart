import 'package:skeletonx/core/environments/environments.dart';

class UATEnvironment extends Environment {
  @override
  final String appName = 'Skeleton X (UAT)';

  @override
  final String baseUrl = 'https://www.thecocktaildb.com/';

  @override
  final String deepLink = 'uat.skeletonx';
}
