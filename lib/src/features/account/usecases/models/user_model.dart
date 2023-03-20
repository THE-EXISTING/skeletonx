import 'package:skeletonx/core/core.dart';

class UserModel with EquatableMixin {
  const UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
  });

  final String userId;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String profileImageUrl;

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        firstName,
        lastName,
        profileImageUrl,
      ];

  @override
  bool? get stringify => true;

  static UserModel fromResponse(UserResponse response) => UserModel(
        userId: response.userId!,
        username: response.username!,
        email: response.email!,
        firstName: response.firstName ?? '',
        lastName: response.lastName ?? '',
        profileImageUrl: response.profileImageUrl ?? '',
      );
}
