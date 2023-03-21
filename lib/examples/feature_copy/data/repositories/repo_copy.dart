import 'package:skeletonx/core/core.dart';

class YourRepositories {
  YourRepositories({
    YourRemoteDataSources? yourRemote,
  }) : _yourRemote = yourRemote ?? YourRemoteDataSources();

  final YourRemoteDataSources _yourRemote;

  // Stream<Resource<TokenModel>> signInWithFacebook() => NetworkBoundResource
  //         .asStream<TokenModel, LoginOrRegisResponse>(
  //       createCallFuture: () => _authRemote.signInWithFacebook(),
  //       processResponse: (reponse) => TokenModel(
  //           accessToken: reponse.accessToken,
  //           refreshToken: reponse.refreshToken),
  //       saveCallResult: (token) {
  //         _authRemote.setupToken(token);
  //         return _authLocal.saveToken(token: token);
  //       },
  //       error: (exception, stackTrace) {
  //         Log.e(exception, stackTrace);
  //       },
  //     );

}
