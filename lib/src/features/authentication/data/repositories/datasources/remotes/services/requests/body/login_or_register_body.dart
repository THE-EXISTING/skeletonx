import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class LoginOrRegisterBody extends RequestBodyX {
  const LoginOrRegisterBody({
    required this.mobileNumber,
  });

  static const String MOBILE_NUMBER_FIELD = 'mobileNumber';

  final String? mobileNumber;

  @override
  Map<String, Object?> toJson() => {
        MOBILE_NUMBER_FIELD: mobileNumber,
      }.removeNullOrEmptyString();

  @override
  List<Object?> get props => <Object?>[mobileNumber];

}
