import 'package:skeletonx/core/core.dart';

class AppColors {
  const AppColors();

  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const transparent = Colors.transparent;

  static final primary = _PrimaryColors();
  static final secondary = _SecondaryColors();

  static final surface = _SurfaceColors();
  static final lineStroke = _LineStrokeColors();

  static const tran = _TransparentColors();

  static final text = _TextColors();
  static final feedback = _FeedbackColors();
  static const paint = _PaintColor();

  static const gradient1 = Color.fromRGBO(245, 103, 86, 1);
  static const gradient2 = Color.fromRGBO(247, 172, 42, 1);
  static const gradient = LinearGradient(
      begin: Alignment(-1.0, -4.0),
      end: Alignment(1.0, 4.0),
      colors: [
        AppColors.gradient1,
        AppColors.gradient2,
      ]);

  static const stateOverlayPrimary = Color.fromRGBO(255, 82, 73, 0.08);
  static const stateOverlayBlack = Color.fromRGBO(0, 0, 0, 0.06);

  static const skeleton = Colors.grey;
}

class _PrimaryColors extends BlueDarkColor {
  _PrimaryColors() : super();

  Color get bg => c25;

  Color get bgStrong => c50;

  Color get weaker => c300;

  Color get weak => c400;

  Color get base => c500;

  Color get strong => c600;

  Color get stronger => c700;
}

class _SecondaryColors extends RoseColor {
  _SecondaryColors() : super();

  Color get bg => c25;

  Color get bgStrong => c50;

  Color get weaker => c300;

  Color get weak => c400;

  Color get base => c500;

  Color get strong => c600;

  Color get stronger => c700;
}


class _TextColors extends GrayModernColor {
  _TextColors() : super();

  Color get lightWeaker => c400;
  Color get lightWeak => c300;
  Color get light => c200;
  Color get lightStrong => c100;
  Color get lightStronger => const Color(0xffFFFFFF);

  Color get darkWeaker => c500;
  Color get darkWeak => c600;
  Color get dark => c700;
  Color get darkStrong => c800;
  Color get darkStronger => c900;
}


class _SurfaceColors extends GrayModernColor {
  _SurfaceColors() : super();

  Color get light => c50;

  Color get lightStrong => c25;

  Color get dark => c800;

  Color get darkStrong => c900;
}

class _LineStrokeColors extends GrayModernColor {
  _LineStrokeColors() : super();

  Color get lightWeak => c300;

  Color get light => c200;

  Color get lightStrong => c100;

  Color get darkWeak => c600;

  Color get dark => c700;

  Color get darkStrong => c800;
}

class _TransparentColors {
  const _TransparentColors();

  final Color lightWeaker = const Color.fromRGBO(255, 255, 255, 0.20);
  final Color lightWeak = const Color.fromRGBO(255, 255, 255, 0.50);
  final Color light = const Color.fromRGBO(255, 255, 255, 0.70);
  final Color lightStrong = const Color.fromRGBO(255, 255, 255, 1);

  final Color darkWeaker = const Color.fromRGBO(0, 0, 0, 0.12);
  final Color darkWeak = const Color.fromRGBO(0, 0, 0, 0.34);
  final Color dark = const Color.fromRGBO(0, 0, 0, 0.60);
  final Color darkStrong = const Color.fromRGBO(0, 0, 0, 0.87);

  final Color white90 = const Color.fromRGBO(255, 255, 255, 0.9);
  final Color white80 = const Color.fromRGBO(255, 255, 255, 0.8);
  final Color white70 = const Color.fromRGBO(255, 255, 255, 0.7);
  final Color white60 = const Color.fromRGBO(255, 255, 255, 0.6);
  final Color white50 = const Color.fromRGBO(255, 255, 255, 0.5);
  final Color white40 = const Color.fromRGBO(255, 255, 255, 0.4);
  final Color white30 = const Color.fromRGBO(255, 255, 255, 0.3);
  final Color white20 = const Color.fromRGBO(255, 255, 255, 0.2);
  final Color white15 = const Color.fromRGBO(255, 255, 255, 0.15);
  final Color white10 = const Color.fromRGBO(255, 255, 255, 0.1);
  final Color white8 = const Color.fromRGBO(255, 255, 255, 0.08);
  final Color white6 = const Color.fromRGBO(255, 255, 255, 0.06);
  final Color white4 = const Color.fromRGBO(255, 255, 255, 0.04);
  final Color white2 = const Color.fromRGBO(255, 255, 255, 0.02);
  final Color white1 = const Color.fromRGBO(255, 255, 255, 0.01);

  final Color black90 = const Color.fromRGBO(0, 0, 0, 0.9);
  final Color black80 = const Color.fromRGBO(0, 0, 0, 0.8);
  final Color black70 = const Color.fromRGBO(0, 0, 0, 0.7);
  final Color black60 = const Color.fromRGBO(0, 0, 0, 0.6);
  final Color black50 = const Color.fromRGBO(0, 0, 0, 0.5);
  final Color black40 = const Color.fromRGBO(0, 0, 0, 0.4);
  final Color black30 = const Color.fromRGBO(0, 0, 0, 0.3);
  final Color black20 = const Color.fromRGBO(0, 0, 0, 0.2);
  final Color black15 = const Color.fromRGBO(0, 0, 0, 0.15);
  final Color black10 = const Color.fromRGBO(0, 0, 0, 0.1);
  final Color black8 = const Color.fromRGBO(0, 0, 0, 0.08);
  final Color black6 = const Color.fromRGBO(0, 0, 0, 0.06);
  final Color black4 = const Color.fromRGBO(0, 0, 0, 0.04);
  final Color black2 = const Color.fromRGBO(0, 0, 0, 0.02);
  final Color black1 = const Color.fromRGBO(0, 0, 0, 0.01);
}

class _FeedbackColors {
  _FeedbackColors();

  final PaletteColor feedback = ErrorColor();

  Color get errorBg => feedback.c25;

  Color get errorBgStrong => feedback.c50;

  Color get errorWeaker => feedback.c300;

  Color get errorWeak => feedback.c400;

  Color get errorBase => feedback.c500;

  Color get errorStrong => feedback.c600;

  Color get errorStronger => feedback.c700;

  final PaletteColor warning = WarningColor();

  Color get warningBg => warning.c25;

  Color get warningBgStrong => warning.c50;

  Color get warningWeaker => warning.c300;

  Color get warningWeak => warning.c400;

  Color get warningBase => warning.c500;

  Color get warningStrong => warning.c600;

  Color get warningStronger => warning.c700;

  final PaletteColor success = SuccessColor();

  Color get successBg => success.c25;

  Color get successBgStrong => success.c50;

  Color get successWeaker => success.c300;

  Color get successWeak => success.c400;

  Color get successBase => success.c500;

  Color get successStrong => success.c600;

  Color get successStronger => success.c700;
}

class _PaintColor {
  const _PaintColor();

  Paint get primary => Paint()
    ..shader = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.repeated,
      colors: [
        AppColors.gradient1,
        AppColors.gradient2,
      ],
    ).createShader(const Rect.fromLTWH(0, 0, 80, 10));
}
