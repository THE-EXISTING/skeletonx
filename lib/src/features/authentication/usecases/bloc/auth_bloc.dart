import 'package:skeletonx/core/core.dart';

enum AuthEvent { signInMobile, requestOTP, confirmOTP, signOut }

class AuthBloc extends BehaviorBlocX<AuthEvent, BlocEvent<AuthEvent>,
    Resource<Object?>> {
  AuthBloc({
    AuthRepository? auth,
  })  : _authRepo = auth ?? AuthRepository(),
        super(Resource.init());

  final AuthRepository _authRepo;

  @override
  Future<void> onListenEvent(BlocEvent<AuthEvent> event) async {
    switch (event.name) {
      case AuthEvent.signInMobile:
        _signInWithMobile(event.data as String);
        break;
      case AuthEvent.confirmOTP:
        _confirmOTP(event.data as String);
        break;
      case AuthEvent.requestOTP:
        _requestOTPAgain(event.data as String);
        break;
      case AuthEvent.signOut:
        _signOut();
        break;
    }
  }

  Future<bool> isSignIn() => _authRepo.isSignIn();

  ///========================= PRIVATE METHOD =========================///
  void _signInWithMobile(String number) async {
    return fetch<Resource<LoginModel>>(
      key: AuthEvent.signInMobile,
      call: _authRepo.signInWithMobile(number: number),
      onResource: (resource) async {
        if (resource.isLoading()) {
          //TODO: Handle loading with your business logic
        }
        if (resource.isSuccess()) {
          emitState(resource);
          //TODO: Handle success with your business logic
        }
        if (resource.isException()) {
          //TODO: Handle error with your business logic
        }
      },
    );
  }

  void _confirmOTP(String otp) async {
    return fetch<Resource<bool>>(
      key: AuthEvent.signInMobile,
      call: _authRepo.confirmOtp(otp: otp, token: ''),
      onResource: (resource) async {
        if (resource.isLoading()) {
          //TODO: Handle loading with your business logic
        }
        if (resource.isSuccess()) {
          emitState(resource);
          //TODO: Handle success with your business logic
        }
        if (resource.isException()) {
          //TODO: Handle error with your business logic
        }
      },
    );
  }

  void _requestOTPAgain(String number) async {
    return fetch<Resource<LoginModel>>(
      key: AuthEvent.signInMobile,
      call: _authRepo.requestOtpAgain(number: number),
      onResource: (resource) async {
        if (resource.isLoading()) {
          //TODO: Handle loading with your business logic
        }
        if (resource.isSuccess()) {
          emitState(resource);
          //TODO: Handle success with your business logic
        }
        if (resource.isException()) {
          //TODO: Handle error with your business logic
        }
      },
    );
  }

  void _signOut() => fetch<Resource<bool>>(
        key: AuthEvent.signOut,
        call: _authRepo.signOut(),
        onResource: (Resource<bool> resource) async {
          if (resource.isLoading()) {
            //TODO: Handle loading with your business logic
          }
          if (resource.isSuccess()) {
            emitState(resource);
            //TODO: Handle success with your business logic
          }
          if (resource.isException()) {
            //TODO: Handle error with your business logic
          }
        },
      );
}
