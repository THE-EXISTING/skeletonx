import 'package:skeletonx/core/core.dart';

class YourRemoteDataSources {
  YourRemoteDataSources({
    YourApiService? yourApiService,
  }) : _yourApiService = yourApiService ?? YourApiService();

  final YourApiService _yourApiService;

  // void setupToken(TokenModel token){
  //   _yourApiService.setupToken(token)        .noWrapResponse();
  // }

  // Future<LoginOrRegisResponse> signInWithMobile(String number) async =>
  //     await _authApiService
  //         .signInOrRegisterWithMobile(
  //         body: LoginOrRegisterBody(mobileNumber: number))
  //         .unWrapResponse();

}
