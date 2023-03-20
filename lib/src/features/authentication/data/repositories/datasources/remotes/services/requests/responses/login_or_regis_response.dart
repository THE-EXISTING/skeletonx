import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
class LoginOrRegisResponse extends ResponseDataX {
  LoginOrRegisResponse({
    required this.ref,
    required this.token,
    required this.expiredIn,
    required this.registered,
  });

  static const String REF_FIELD = 'ref';
  static const String TOKEN_FIELD = 'token';
  static const String EXPIRES_FIELD = 'expiresIn';
  static const String REGISTERED_FIELD = 'registered';

  final String ref;
  final String token;
  final int expiredIn;
  final bool registered;

  @override
  List<Object?> get props => [
        ref,
        token,
        expiredIn,
        registered,
      ];

  static LoginOrRegisResponse fromJsonStr(String data) =>
      LoginOrRegisResponse.fromJson(json.decode(data));

  static LoginOrRegisResponse fromJson(Map<String, dynamic> json) =>
      LoginOrRegisResponse(
        ref: json[REF_FIELD] as String,
        token: json[TOKEN_FIELD] as String,
        expiredIn: json[EXPIRES_FIELD] as int,
        registered: json[REGISTERED_FIELD] as bool,
      );
}
