import 'package:skeletonx/core/environments/environments.dart';

class ProdEnvironment extends Environment {
  @override
  final String appName = 'Skeleton X';

  @override
  final String baseUrl = 'https://www.thecocktaildb.com/';

  @override
  final String deepLink = 'prod.skeletonx';
}
