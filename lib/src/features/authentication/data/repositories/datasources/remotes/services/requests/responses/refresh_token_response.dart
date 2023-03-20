import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class RefreshTokenResponse extends ResponseDataX {
   RefreshTokenResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  static const String ACC_TOKEN_FIELD = 'accessToken';
  static const String REFRESH_TOKEN_FIELD = 'refreshToken';

  final String accessToken;
  final String refreshToken;

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];

  static RefreshTokenResponse fromJsonStr(String data) =>
      RefreshTokenResponse.fromJson(json.decode(data));

  static RefreshTokenResponse fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponse(
        accessToken: json[ACC_TOKEN_FIELD] as String,
        refreshToken: json[REFRESH_TOKEN_FIELD] as String,
      );
}
