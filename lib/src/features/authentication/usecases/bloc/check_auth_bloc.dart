import 'package:skeletonx/core/core.dart';

enum CheckSignInEvent { checkSignIn }

class CheckSignInState {
  const CheckSignInState({
    required this.isSignIn,
  });

  final bool isSignIn;
}

class CheckSignInBloc extends BehaviorBlocX<CheckSignInEvent, BlocEvent<CheckSignInEvent>,
    Resource<CheckSignInState>> {
  CheckSignInBloc({
    bool isSignInChecked = false,
    AuthRepository? auth,
  })  : _authRepo = auth ?? AuthRepository(),
        _isSignInChecked = isSignInChecked,
        super(Resource.init());

  final AuthRepository _authRepo;
  bool _isSignInChecked;
  bool _isSignedIn = false;

  bool get isSignInChecked => _isSignInChecked;
  bool get isSignedIn => _isSignedIn;

  @override
  Future<void> onListenEvent(BlocEvent<CheckSignInEvent> event) async {
    switch (event.name) {
      case CheckSignInEvent.checkSignIn:
        _checkSignIn();
        break;
    }
  }

  Future<void> _checkSignIn() async {
    try {
      final isSignIn = await _authRepo.isSignIn();
      _isSignedIn = isSignIn;
      _isSignInChecked = true;
      emitState(Resource.success(data: CheckSignInState(isSignIn: isSignIn)));
    } catch (_) {
      _isSignInChecked = true;
      emitState(Resource.success(data: const CheckSignInState(isSignIn: false)));
    }
  }
}
