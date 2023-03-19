import 'package:skeletonx/core/core.dart';

class TokenDatabase extends AppSecureLocalDatabase {
  const TokenDatabase();

  static const accessTokenKey = 'access_token';
  static const refreshTokenKey = 'refresh_token';

  Future<TokenModel> loadToken() async {
    final String accessToken = await load(key: accessTokenKey, defaultData: '');
    final String refreshToken = await load(key: refreshTokenKey, defaultData: '');
    return TokenModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<void> saveToken({required TokenModel token}) async {
    Log.i(token);
    final String accessToken = token.accessToken;
    final String refreshToken = token.refreshToken;
    await save(key: accessTokenKey, data: accessToken);
    await save(key: refreshTokenKey, data: refreshToken);
  }

  Future<void> deleteToken() async {
    await save(key: accessTokenKey, data: '');
    await save(key: refreshTokenKey, data: '');
  }

}
