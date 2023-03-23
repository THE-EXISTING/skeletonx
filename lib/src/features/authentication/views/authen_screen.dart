import 'package:skeletonx/core/core.dart';

enum AuthenPageEvent { showErrorSignIn }

class AuthenScreen extends AppScreen {
  const AuthenScreen._({
    required Key key,
  }) : super(key: key);

  static Widget createScreen() => const AuthenScreen._(
        key: Key('AuthenticationScreen'),
      );

  @override
  State<AuthenScreen> createState() => _AuthenPageState();
}

class _AuthenPageState extends AppScreenLocaleScaffoldBlocState<AuthenScreen,
    AuthBloc, Resource<Object?>> {
  AuthBloc get signInBloc => context.read<AuthBloc>();

  @override
  void onListenEvent(BuildContext context, Object event, Object? data) {
    switch (event) {
      case AuthenPageEvent.showErrorSignIn:
        //TODO: Show auth error
        break;
    }
  }

  @override
  Widget buildBody(BuildContext context, Resource<Object?> state) {
    return const TodoView(todo: TodoFeature.authentication, appbar: true);
  }

  @override
  void onListenBloc(context, resource) async {
    super.onListenBloc(context, resource);
    //TODO: Handle listener
  }

  ///========================= PRIVATE METHOD =========================///
  void _clickSignInWithMobile(String number) =>
      signInBloc.add(ClickEvent(AuthEvent.signInMobile, data: number));

  void _clickConfirmOTP(String otp) =>
      signInBloc.add(ClickEvent(AuthEvent.confirmOTP, data: otp));

  void _clickRequestOtpAgain(String number) =>
      signInBloc.add(ClickEvent(AuthEvent.requestOTP, data: number));
}