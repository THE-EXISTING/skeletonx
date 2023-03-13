import 'package:skeletonx/core/core.dart';

///
/// Primary Font Styles (Anuphan)
///

// ignore_for_file: constant_identifier_names
class AppTextStyle {
  static const String _primaryFont = 'Anuphan';
  static const String _secondary = '';
  static const String _numberFont = 'Prompt';

  static const _PrimaryTextStyle primary = _PrimaryTextStyle();
}

class _PrimaryTextStyle {
  const _PrimaryTextStyle();

  TextColorStyleX h1(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 96.0 + _increaseSize(context),
        letterSpacing: -1.5,
      );

  TextColorStyleX h2(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 60.0 + _increaseSize(context),
        letterSpacing: -0.5,
      );

  TextColorStyleX h3(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 48.0 + _increaseSize(context),
      );

  TextColorStyleX h4(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 34.0 + _increaseSize(context),
        letterSpacing: 0.5,
      );

  TextColorStyleX h5(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 24.0 + _increaseSize(context),
        letterSpacing: 0.5,
      );

  TextColorStyleX h6(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 20.0 + _increaseSize(context),
        letterSpacing: 0.25,
      );

  TextColorStyleX titleBase(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 16.0 + _increaseSize(context),
        letterSpacing: 0.5,
      );

  TextColorStyleX titleSm(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 14.0 + _increaseSize(context),
        letterSpacing: 0.5,
      );

  TextColorStyleX bodyLg(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16.0 + _increaseSize(context),
        letterSpacing: 0.25,
        lineHeight: 24.00 + _increaseSize(context),
      );

  TextColorStyleX bodyBase(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14.0 + _increaseSize(context),
        letterSpacing: 0.25,
        lineHeight: 22.00 + _increaseSize(context),
      );

  TextColorStyleX bodySm(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14.0 + _increaseSize(context),
        letterSpacing: 0.25,
        lineHeight: 22.00 + _increaseSize(context),
      );

  TextColorStyleX bodyXs(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14.0 + _increaseSize(context),
        lineHeight: 19.00 + _increaseSize(context),
        letterSpacing: 0.25,
      );

  TextColorStyleX buttonLg(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 20.0 + _increaseSize(context),
        letterSpacing: 0.5,
      );

  TextColorStyleX buttonBase(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 18.0 + _increaseSize(context),
        letterSpacing: 0.5,
      );

  TextColorStyleX buttonSm(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 16.0 + _increaseSize(context),
        letterSpacing: 0.3,
      );

  TextColorStyleX buttonXs(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 14.0 + _increaseSize(context),
        letterSpacing: 0.3,
      );

  TextColorStyleX captionBase(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 16.0 + _increaseSize(context),
        letterSpacing: 0.5,
      );

  TextColorStyleX captionSm(BuildContext context) => _TextColorStyle(
        fontFamily: AppTextStyle._primaryFont,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 14 + _increaseSize(context),
        letterSpacing: 0.5,
      );

  double _increaseSize(
    BuildContext context, {
    double? tablet,
    double? desktop,
  }) {
    Breakpoint breakpoint = AppBreakpoint.checkBreakPoint(context);
    switch (breakpoint) {
      case Breakpoint.mobile:
        return 0.0;
      case Breakpoint.mobileLand:
        return 0.0;
      case Breakpoint.tablet:
        if (tablet != null) return tablet;
        return 0.5;
      case Breakpoint.desktop:
        if (desktop != null) return desktop;
        return 1.0;
      case Breakpoint.desktopLg:
        if (desktop != null) return desktop;
        return 1.0;
      case Breakpoint.desktop4k:
        if (desktop != null) return desktop;
        return 1.0;
    }
  }
}

class _TextColorStyle extends TextColorStyleX {
  const _TextColorStyle({
    required String fontFamily,
    required FontWeight fontWeight,
    required FontStyle fontStyle,
    required double fontSize,
    double? letterSpacing,
    double? lineHeight,
  }) : super(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          lineHeight: lineHeight,
        );

  @override
  TextStyle get primary => createTextStyle(color: AppColors.primary.base);

  @override
  TextStyle get secondary => createTextStyle(color: AppColors.secondary.base);

  @override
  TextStyle get darkStrong => createTextStyle(color: AppColors.text.darkStrong);

  @override
  TextStyle get dark => throw createTextStyle(color: AppColors.text.dark);

  @override
  TextStyle get darkWeak => createTextStyle(color: AppColors.text.darkWeak);

  @override
  TextStyle get darkWeaker => createTextStyle(color: AppColors.text.darkWeaker);

  @override
  TextStyle get lightStrong =>
      createTextStyle(color: AppColors.text.lightStrong);

  @override
  TextStyle get light => throw createTextStyle(color: AppColors.text.light);

  @override
  TextStyle get lightWeak =>
      throw createTextStyle(color: AppColors.text.lightWeak);

  @override
  TextStyle get lightWeaker =>
      throw createTextStyle(color: AppColors.text.lightWeaker);

  @override
  TextStyle custom({required Color color, Paint? paint}) => createTextStyle(
        color: color,
        paint: paint,
      );
}
