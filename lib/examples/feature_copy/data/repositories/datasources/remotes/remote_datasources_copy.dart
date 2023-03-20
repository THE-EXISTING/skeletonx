import 'package:skeletonx/core/core.dart';

class YourRemoteDataSources {
  YourRemoteDataSources({
    YourApiService? yourApiService,
  }) : _yourApiService = yourApiService ?? YourApiService();

  final YourApiService _yourApiService;

  // void setupToken(TokenModel token){
  //   _yourApiService.setupToken(token)        .noWrapResponse();
  // }

}
