import 'package:skeletonx/core/core.dart';

class AppScrollView extends AppComponent {
  const AppScrollView({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget buildDefault(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: child,
        ));
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  const NoGlowScrollBehavior();

  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
