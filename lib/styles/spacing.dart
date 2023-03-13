import 'package:skeletonx/core/core.dart';

class AppSize {
  static const icon = _IconSize();
  static const bigIcon = _BigIconSize();
  static const button = _ButtonSize();
  static const list = _ListSize();

  static const double symmetricHorizontal = 16.00;
  static const double toolbar = kToolbarHeight;
  static const double toolbarExtra = kToolbarHeight + 8;
  static const double tabBar = 48.00;

  static EdgeInsets get symmetricHorizontalInsets =>
      const EdgeInsets.symmetric(horizontal: symmetricHorizontal);

  static EdgeInsets get listVerticalPadding =>
      const EdgeInsets.only(top: 8, bottom: 40);

  static Widget get listSeparator => const Space.box(2);
  static Widget get sectionSeparator => const Space.box(8);
}

class _IconSize {
  const _IconSize();

  final double s = 20;
  final double x = 24;
  final double xl = 28;
  final double xxl = 32;
}

class _BigIconSize {
  const _BigIconSize();

  final double s = 56;
  final double x = 64;
  final double xl = 72;
  final double xxl = 84;
}

class _ButtonSize {
  const _ButtonSize();

  final double sss = 32;
  final double ss = 36;
  final double s = 40;
  final double x = 44;
  final double xl = 48;
  final double xxl = 56;
}

class _ListSize {
  const _ListSize();

  final double s = 48;
  final double x = 56;
  final double xl = 64;
}
