import 'package:skeletonx/core/core.dart';

class AuthLocalDataSources {
  static final AuthLocalDataSources _singleton = AuthLocalDataSources._();

  AuthLocalDataSources._({
    TokenDatabase? authTokenDatabase,
    UserDatabase? userDatabase,
  })  : _authTokenDatabase = authTokenDatabase ?? const TokenDatabase(),
        _userDatabase = userDatabase ?? const UserDatabase();

  factory AuthLocalDataSources() => _singleton;

  TokenModel? _token;
  UserModel? _user;

  set _setToken(TokenModel? token) => _token = token;

  set _setUser(UserModel? user) => _user = user;

  final TokenDatabase _authTokenDatabase;
  final UserDatabase _userDatabase;

  Future<TokenModel> loadToken() async {
    final token = _token ?? await _authTokenDatabase.loadToken();
    _setToken = token;
    return token;
  }

  Future<UserModel> loadUser() async {
    final user = _user ?? await _userDatabase.loadUser();
    _setUser = user;
    return user;
  }

  Future<void> saveToken({required TokenModel token}) async {
    await _authTokenDatabase.saveToken(token: token);
    _setToken = token;
  }

  Future<void> saveUser({required UserModel user}) async {
    await _userDatabase.saveUserModel(user: user);
    _setUser = user;
  }

  Future<void> deleteCredential() async {
    await _authTokenDatabase.deleteToken();
    await _userDatabase.deleteUser();
    _setToken = null;
    _setUser = null;
  }

  Future<void> deleteUser() async {
    await _userDatabase.deleteUser();
    _setUser = null;
  }
}
