import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class ConfirmOTPResponse extends ResponseDataX {
  ConfirmOTPResponse({
    required this.type,
    required this.accessToken,
    required this.refreshToken,
    required this.expiredIn,
    required this.registered,
  });

  static const String TYPE_FIELD = 'accessToken';
  static const String ACC_TOKEN_FIELD = 'accessToken';
  static const String REFRESH_TOKEN_FIELD = 'refreshToken';
  static const String EXPIRED_FIELD = 'expiresIn';
  static const String REGISTERED_FIELD = 'registered';

  final String type;
  final String accessToken;
  final String refreshToken;
  final int expiredIn;
  final bool registered;

  @override
  List<Object?> get props => [
        type,
        accessToken,
        refreshToken,
        expiredIn,
        registered,
      ];

  static ConfirmOTPResponse fromJsonStr(String data) =>
      ConfirmOTPResponse.fromJson(json.decode(data));

  static ConfirmOTPResponse fromJson(Map<String, dynamic> json) =>
      ConfirmOTPResponse(
        type: json[TYPE_FIELD] as String,
        accessToken: json[ACC_TOKEN_FIELD] as String,
        refreshToken: json[REFRESH_TOKEN_FIELD] as String,
        expiredIn: json[EXPIRED_FIELD] as int,
        registered: json[REGISTERED_FIELD] as bool,
      );
}
