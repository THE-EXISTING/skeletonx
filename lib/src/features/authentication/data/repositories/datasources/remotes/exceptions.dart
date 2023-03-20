import 'package:skeletonx/core/core.dart';

enum AuthRemoteExceptionType {
  //
  ERROR_ANONYMOUS_MISSING_USER,
  //
  ERROR_EMAIL_MISSING_USER,
  //
  ERROR_GOOGLE_MISSING_USER,
  ERROR_GOOGLE_MISSING_AUTH,
  ERROR_GOOGLE_EXISTING_ACC,
  ERROR_GOOGLE_UNIMPLEMENT,
  ERROR_GOOGLE_USER_ABORT,
  //
  ERROR_FACEBOOK_MISSING_USER,
  ERROR_FACEBOOK_MISSING_TOKEN,
  ERROR_FACEBOOK_EXISTING_ACC,
  ERROR_FACEBOOK_SIGN_IN,
  ERROR_FACEBOOK_UNIMPLEMENT,
  USER_ABORT_FACEBOOK,
  //
  ERROR_SIGN_OUT,
}

class AuthRemoteException {
  const AuthRemoteException._();

  //---------- Anonymous -------------//
  // static FirebaseAuthException anonymousMissingUser([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_GOOGLE_MISSING_USER.toString(),
  //       message: msg ?? 'Missing Firebase user',
  //     );
  //
  // //---------- Email & Password -------------//
  // static FirebaseAuthException emailMissingUser([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_EMAIL_MISSING_USER.toString(),
  //       message: msg ?? 'Missing Firebase user',
  //     );
  //
  // //---------- Google -------------//
  // static FirebaseAuthException googleMissingUser([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_GOOGLE_MISSING_USER.toString(),
  //       message: msg ?? 'Missing Firebase user',
  //     );
  //
  // static FirebaseAuthException googleMissingAuth([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_GOOGLE_MISSING_AUTH.toString(),
  //       message: msg ?? 'Missing Google Auth',
  //     );
  //
  // static FirebaseAuthException googleExistingAcc([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_GOOGLE_EXISTING_ACC.toString(),
  //       message: msg ?? 'No message',
  //     );
  //
  // static FirebaseAuthException googleUnimplement([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_GOOGLE_UNIMPLEMENT.toString(),
  //       message: msg ?? 'No message',
  //     );
  //
  // static FirebaseAuthException googleUserAbort([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_GOOGLE_USER_ABORT.toString(),
  //       message: msg ?? 'User abort sign-in with Google',
  //     );
  //
  // //---------- Facebook -------------//
  // static FirebaseAuthException facebookUserAbort([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.USER_ABORT_FACEBOOK.toString(),
  //       message: msg ?? 'Cancelled by the user.',
  //     );
  //
  // static FirebaseAuthException facebookMissingUser([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_FACEBOOK_MISSING_USER.toString(),
  //       message: msg ?? 'Missing Firebase user',
  //     );
  //
  // static FirebaseAuthException facebookMissingToken([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_FACEBOOK_MISSING_TOKEN.toString(),
  //       message: msg ?? 'Missing Facebook Token',
  //     );
  //
  // static FirebaseAuthException facebookErrorSignIn([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_FACEBOOK_SIGN_IN.toString(),
  //       message: msg ?? 'No message',
  //     );
  //
  // static FirebaseAuthException facebookExistingAcc([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_FACEBOOK_EXISTING_ACC.toString(),
  //       message: msg ?? 'No message',
  //     );
  //
  // static FirebaseAuthException facebookUnimplement([String? msg]) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_FACEBOOK_UNIMPLEMENT.toString(),
  //       message: msg ?? 'No message',
  //     );
  //
  // //---------------------//
  // static FirebaseAuthException signOut(String? msg) => //
  //     FirebaseAuthException(
  //       code: AuthRemoteExceptionType.ERROR_SIGN_OUT.toString(),
  //       message: msg ?? 'No message',
  //     );
}
