import 'package:skeletonx/core/core.dart';

class TokenModel extends ModelX<TokenModel> {
  TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  final String refreshToken;
  final String accessToken;

  bool get isEmptyToken => accessToken.isEmpty && refreshToken.isEmpty;

  bool get isNotEmptyToken => !isEmptyToken;

  bool get isAccessEmpty => accessToken.isEmpty;

  bool get isAccessNotEmpty => !isAccessEmpty;

  bool get isRefreshEmpty => refreshToken.isEmpty;

  bool get isRefreshNotEmpty => !isRefreshEmpty;

  @override
  List<Object?> get props => [
        refreshToken,
        accessToken,
      ];

  @override
  TokenModel copyWith({
    String? accessToken,
    String? refreshToken,
    bool? isRegistered,
  }) =>
      TokenModel(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  static TokenModel fromResponse(ConfirmOTPResponse response) => TokenModel(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

  static TokenModel fromJson(Map<String, dynamic> map) => TokenModel(
        refreshToken: map['refreshToken'] as String,
        accessToken: map['accessToken'] as String,
      );
}
