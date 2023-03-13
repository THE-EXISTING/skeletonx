import 'package:skeletonx/core/core.dart';

class AppColors {
  const AppColors();

  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);

  static const surface = _SurfaceColors();
  static const line = _LineColors();
  static const stroke = _StrokeColors();

  static const tran = _TransparentColors();

  static const text = _TextColors();
  static const status = _FeedbackColors();
  static const paint = _PaintColor();

  static const primary = _PrimaryColors();
  static const secondary = _SecondaryColors();

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

  static const transparent = Colors.transparent;
  static const skeleton = Colors.grey;
}

class _PrimaryColors {
  const _PrimaryColors();

  final bg = const Color(0xffF4FAFF);
  final bgStrong = const Color(0xffE9F5FE);
  final weaker = const Color(0xffD2EBFE);
  final weak = const Color(0xffA6D7FC);
  final base = const Color(0xff209AF8);
  final strong = const Color(0xff1A7BC6);
  final stronger = const Color(0xff135C95);
}

class _SecondaryColors {
  const _SecondaryColors();

  final Color bg = const Color(0xffFDF3F7);
  final Color bgStrong = const Color(0xffFCE7F0);
  final Color weaker = const Color(0xffF8CFE0);
  final Color weak = const Color(0xffF19EC1);
  final Color base = const Color(0xffDD0D64);
  final Color strong = const Color(0xffB10A50);
  final Color stronger = const Color(0xff85083C);
}

class _SurfaceColors {
  const _SurfaceColors();

  final light = const Color(0xfff5f7fa);
  final lightStrong = const Color(0xffffffff);

  final dark = const Color(0xff101828);
  final darkStrong = const Color(0xff070E1E);
}

class _LineColors {
  const _LineColors();

  final light = const Color(0xffE4E7EC);
  final lightStrong = const Color(0xffF2F4F7);

  final dark = const Color(0xff344054);
  final darkStrong = const Color(0xff1D2939);
}

class _StrokeColors {
  const _StrokeColors();

  final Color light = const Color(0xffE4E7EC);
  final Color lightStrong = const Color(0xffF2F4F7);

  final Color dark = const Color(0xff344054);
  final Color darkStrong = const Color(0xff1D2939);
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
  final Color black10 = const Color.fromRGBO(0, 0, 0, 0.1);
  final Color black8 = const Color.fromRGBO(0, 0, 0, 0.08);
  final Color black6 = const Color.fromRGBO(0, 0, 0, 0.06);
  final Color black4 = const Color.fromRGBO(0, 0, 0, 0.04);
  final Color black2 = const Color.fromRGBO(0, 0, 0, 0.02);
  final Color black1 = const Color.fromRGBO(0, 0, 0, 0.01);
}

class _TextColors {
  const _TextColors();

  final Color lightWeaker = const Color(0xffD0D5DD);
  final Color lightWeak = const Color(0xffE4E7EC);
  final Color light = const Color(0xffF2F4F7);
  final Color lightStrong = const Color(0xffFFFFFF);

  final Color darkWeaker = const Color(0xff98A2B3);
  final Color darkWeak = const Color(0xff667085);
  final Color dark = const Color(0xff1D2939);
  final Color darkStrong = const Color(0xff101828);
}

class _FeedbackColors {
  const _FeedbackColors();

  final Color errorBg = const Color(0xffFBEAE9);
  final Color errorWeaker = const Color(0xffF7D5D3);
  final Color errorWeak = const Color(0xffE8817A);
  final Color errorBase = const Color(0xffD92D21);
  final Color errorStrong = const Color(0xffAE241A);

  final Color warningBg = const Color(0xffFFFAEB);
  final Color warningWeaker = const Color(0xffFEF0C7);
  final Color warningWeak = const Color(0xffFEC84B);
  final Color warningBase = const Color(0xffF79009);
  final Color warningStrong = const Color(0xffDC6803);

  final Color successBg = const Color(0xffECFDF3);
  final Color successWeaker = const Color(0xffD1FADF);
  final Color successWeak = const Color(0xff6CE9A6);
  final Color successBase = const Color(0xff12B76A);
  final Color successStrong = const Color(0xff039855);
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

