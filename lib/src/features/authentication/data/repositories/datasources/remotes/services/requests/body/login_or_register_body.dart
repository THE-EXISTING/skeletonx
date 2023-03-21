import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class LoginOrRegisterBody extends RequestBodyX {
  const LoginOrRegisterBody({
    required this.mobileNumber,
    this.ref,
  });

  static const String MOBILE_NUMBER_FIELD = 'mobileNumber';
  static const String REF_FIELD = 'refId';

  final String? mobileNumber;
  final String? ref;

  @override
  Map<String, Object?> toJson() => {
        MOBILE_NUMBER_FIELD: mobileNumber,
        REF_FIELD: ref,
      }.removeNullOrEmptyString();

  @override
  List<Object?> get props => <Object?>[mobileNumber, ref];
}
