import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names
enum FontType { primary, secondary }

enum FontLevel { text, display }

class AppTextStyleBuilder {
  FontType _type = FontType.primary;
  double _size = 16.0;
  double _height = 24.0;
  double _letterSpace = 0.0;
  FontWeight _weight = FontWeight.w400;
  Color? _color = AppColors.text.dark;
  FontStyle? _style = FontStyle.normal;
  FontLevel? _level = FontLevel.text;

  ///========================= TYPE =========================///
  static AppTextStyleBuilder get primaryText => AppTextStyleBuilder()
    .._level = FontLevel.text
    .._type = FontType.primary;

  static AppTextStyleBuilder get primaryDisplay => AppTextStyleBuilder()
    .._level = FontLevel.display
    .._type = FontType.primary;

  static AppTextStyleBuilder get secondaryText => AppTextStyleBuilder()
    .._level = FontLevel.text
    .._type = FontType.secondary;

  static AppTextStyleBuilder get secondaryDisplay => AppTextStyleBuilder()
    .._level = FontLevel.display
    .._type = FontType.secondary;

  ///========================= SIZE =========================///
  AppTextStyleBuilder get xs => this
    .._size = _level == FontLevel.text ? 12.0 : 24.0
    .._height = _level == FontLevel.text ? 18.0 : 32.0
    .._letterSpace = 0.0;

  AppTextStyleBuilder get sm => this
    .._size = _level == FontLevel.text ? 14.0 : 30.0
    .._height = _level == FontLevel.text ? 20.0 : 38.0
    .._letterSpace = 0.0;

  AppTextStyleBuilder get md => this
    .._size = _level == FontLevel.text ? 16.0 : 36.0
    .._height = _level == FontLevel.text ? 24.0 : 44.0
    .._letterSpace = 0.0;

  AppTextStyleBuilder get lg => this
    .._size = _level == FontLevel.text ? 18.0 : 48.0
    .._height = _level == FontLevel.text ? 28.0 : 60.0
    .._letterSpace = 0.0;

  AppTextStyleBuilder get xl => this
    .._size = _level == FontLevel.text ? 20.0 : 60.0
    .._height = _level == FontLevel.text ? 30.0 : 72.0
    .._letterSpace = 0.0;

  AppTextStyleBuilder get xxl => this
    .._size = _level == FontLevel.text ? 20.0 : 72.0
    .._height = _level == FontLevel.text ? 30.0 : 90.0
    .._letterSpace = 0.0;

  ///========================= COLOR =========================///
  AppTextStyleBuilder get colorPrimary => this.._color = AppColors.primary.base;

  AppTextStyleBuilder get dark => this.._color = AppColors.text.dark;

  AppTextStyleBuilder get lightStrong =>
      this.._color = AppColors.text.lightStrong;

  ///========================= WEIGHT =========================///
  AppTextStyleBuilder get light => this.._weight = FontWeight.w300;

  AppTextStyleBuilder get medium => this.._weight = FontWeight.w500;

  AppTextStyleBuilder get semiBold => this.._weight = FontWeight.w600;

  AppTextStyleBuilder get bold => this.._weight = FontWeight.w700;

  AppTextStyleBuilder get italic => this.._style = FontStyle.italic;

  TextStyle build(BuildContext context) {
    final language = Localizations.localeOf(context);
    final increaseSize = _increaseSize(context);
    return TextStyle(
      fontFamily: _getFontFamily(language, _type),
      fontWeight: _weight,
      fontStyle: _style,
      fontSize: _size + increaseSize,
      letterSpacing: _letterSpace,
      color: _color,
      height: _height / (_size + increaseSize),
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  ///========================= PRIVATE METHOD =========================///
  String _getFontFamily(Locale locale, FontType type) {
    if ('th'.contains(locale.languageCode) && type == FontType.primary) {
      return 'PrimaryThai';
    } else if ('en'.contains(locale.languageCode) && type == FontType.primary) {
      return 'PrimaryEnglish';
    } else {
      return 'PrimaryEnglish';
    }
  }

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
      case Breakpoint.desktopXl:
        if (desktop != null) return desktop;
        return 1.0;
    }
  }
}
