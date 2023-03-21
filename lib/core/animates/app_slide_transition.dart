import 'package:skeletonx/core/core.dart';

class AppSlidePageTransition<T> extends PageTransitionX<T> {

  AppSlidePageTransition(Widget page, {
    Key? key,
    Widget? childCurrent,
    PageTransitionType type = PageTransitionType.rightToLeft,
    bool inheritTheme = false,
    Curve curve = Curves.easeInOutQuint,
    Alignment? alignment,
    Duration duration = const Duration(milliseconds: 350),
    Duration reverseDuration = const Duration(milliseconds: 200),
    bool fullscreenDialog = false,
    RouteSettings? settings,
  }) : super(
    key: key,
    child: page,
    childCurrent: childCurrent,
    type: type,
    inheritTheme: inheritTheme,
    curve: curve,
    alignment: alignment,
    duration: duration,
    reverseDuration: reverseDuration,
    fullscreenDialog: fullscreenDialog,
    settings: settings,
  );
}