// ignore_for_file: constant_identifier_names,non_constant_identifier_names
import 'package:skeletonx/core/core.dart';

class YourApiService extends AppApiService {
  static const URL_ENDPOINT = 'get-api-endpoint';

  YourApiService();

  // Future<Response<YourModel>> getYourService(
  //     {required YourBody body})  {
  //   return  post(GET_ENDPOINT,
  //           data: body,
  //           converter: (json) => LoginOrRegisResponse.fromJson(json),
  //           isUseToken: true);
  // }

  Future<Response<void>> getYourService({required YourResponse body}) {
    throw UnimplementedError();
  }
}
