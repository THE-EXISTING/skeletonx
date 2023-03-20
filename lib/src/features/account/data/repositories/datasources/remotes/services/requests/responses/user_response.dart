import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class UserResponse extends ResponseDataX {
  const UserResponse({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
  });

  static const String USER_ID_FIELD = 'userID';
  static const String USER_FIELD = 'username';
  static const String EMAIL_FIELD = 'email';
  static const String FIRST_NAME_FIELD = 'firstName';
  static const String LAST_NAME_FIELD = 'lastName';
  static const String IMG_FIELD = 'profileImageURL';

  final String? userId;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? profileImageUrl;

  @override
  List<Object?> get props => <Object?>[
        userId,
        username,
        email,
        firstName,
        lastName,
        profileImageUrl,
      ];

  static UserResponse fromJsonStr(String data) =>
      UserResponse.fromJson(json.decode(data));

  static UserResponse fromJson(Map<String, dynamic> json) => UserResponse(
        userId: json[USER_ID_FIELD] as String?,
        username: json[USER_FIELD] as String?,
        email: json[EMAIL_FIELD] as String?,
        firstName: json[FIRST_NAME_FIELD] as String?,
        lastName: json[LAST_NAME_FIELD] as String?,
        profileImageUrl: json[IMG_FIELD] as String?,
      );
}
