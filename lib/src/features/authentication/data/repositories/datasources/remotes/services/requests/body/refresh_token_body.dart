import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class RefreshTokenBody extends RequestBodyX {
  const RefreshTokenBody({
    required this.refreshToken,
  });

  static const String REFRESH_TOKEN_FIELD = 'refreshToken';

  final String refreshToken;

  @override
  List<Object?> get props => [
    refreshToken,
  ];

  @override
  Map<String, Object?> toJson() => {
    REFRESH_TOKEN_FIELD: refreshToken,
  }.removeNullOrEmptyString();

  static RefreshTokenBody fromJsonStr(String data) =>
      RefreshTokenBody.fromJson(json.decode(data));

  static RefreshTokenBody fromJson(Map<String, dynamic> json) {
    return RefreshTokenBody(
      refreshToken: json[REFRESH_TOKEN_FIELD] as String,
    );
  }
}
