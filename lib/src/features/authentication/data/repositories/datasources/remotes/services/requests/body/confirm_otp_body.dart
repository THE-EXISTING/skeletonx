import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class ConfirmOTPBody extends RequestBodyX {
  const ConfirmOTPBody({
    required this.otp,
    required this.token,
  });

  static const String OTP_FIELD = 'otp';
  static const String TOKEN_FIELD = 'token';

  final String otp;
  final String token;

  @override
  List<Object?> get props => [
    otp,
    token,
  ];

  @override
  Map<String, Object?> toJson() => {
    OTP_FIELD: otp,
    TOKEN_FIELD: token,
  }.removeNullOrEmptyString();
}