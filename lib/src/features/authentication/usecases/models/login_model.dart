import 'package:skeletonx/core/core.dart';

class LoginModel extends ModelX<LoginModel> {
  LoginModel({
    required this.referenceCode,
    required this.isRegistered,
    required this.otpToken,
  });

  final String referenceCode;
  final String otpToken;
  final bool isRegistered;

  @override
  List<Object?> get props => [
        referenceCode,
        otpToken,
        isRegistered,
      ];


  @override
  LoginModel copyWith({
    String? referenceCode,
    String? otpToken,
    bool? isRegistered,
  }) =>
      LoginModel(
        referenceCode: referenceCode ?? this.referenceCode,
        otpToken: otpToken ?? this.otpToken,
        isRegistered: isRegistered ?? this.isRegistered,
      );

  static LoginModel fromResponse(LoginOrRegisResponse response) => LoginModel(
        referenceCode: response.ref,
        otpToken: response.token,
        isRegistered: response.registered,
      );
}
