import 'package:skeletonx/core/core.dart';

//TODO: Change to HIVE database
class UserDatabase extends AppSecureLocalDatabase {
  const UserDatabase();

  static const userIDKey = 'USER_ID_KEY';
  static const usernameKey = 'USERNAME_KEY';
  static const userEmailKey = 'EMAIL_KEY';
  static const firstnameKey = 'FIRSTNAME_KEY';
  static const lastNameKey = 'LASTNAME_KEY';
  static const profileImageUrlKey = 'PROFILE_IMAGE_URL_KEY';

  Future<UserModel> loadUser() async {
    final String userId = await load(key: userIDKey, defaultData: '');
    final String email = await load(key: userEmailKey, defaultData: '');
    final String username = await load(key: usernameKey, defaultData: '');
    final String firstName =
        await load(key: firstnameKey, defaultData: 'Guest');
    final String lastName = await load(key: lastNameKey, defaultData: '');
    final String profileImageUrl =
        await load(key: profileImageUrlKey, defaultData: '');
    return Future.value(UserModel(
      userId: userId,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      profileImageUrl: profileImageUrl,
    ));
  }

  Future<void> saveUserModel({required UserModel user}) async {
    final String userId = user.userId;
    final String email = user.email;
    final String username = user.username;
    final String firstName = user.firstName;
    final String lastName = user.lastName;
    final String profileImageUrl = user.profileImageUrl;

    await save(key: userIDKey, data: userId);
    await save(key: usernameKey, data: email);
    await save(key: userEmailKey, data: username);
    await save(key: firstnameKey, data: firstName);
    await save(key: lastNameKey, data: lastName);
    await save(key: profileImageUrlKey, data: profileImageUrl);
  }

  Future<void> deleteUser() async {
    await delete(key: userIDKey);
    await delete(key: usernameKey);
    await delete(key: userEmailKey);
    await delete(key: firstnameKey);
    await delete(key: lastNameKey);
    await delete(key: profileImageUrlKey);
  }
}
