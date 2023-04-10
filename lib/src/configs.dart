import 'package:skeletonx/core/core.dart';

class AppConfig {
  ///========================= NETWORK CONFIGS =========================///
  static String get apiBaseUrl => AppEnvironment.instance.baseUrl;

  static String get socketBaseUrl => AppEnvironment.instance.baseUrl;

  static const String refreshTokenPath = 'api/auth/refresh';
  static const Duration timeout = Duration(milliseconds: 20000);

  static final theme = _AppThemeConfig();
}

//TODO: Need research
class _AppThemeConfig {
  final AppThemeData lightTheme = AppThemeData(
    themeMode: ThemeMode.light,
    primaryColor: AppColors.primary.base,
    primaryColorOverlay: AppColors.primary.base.darken(5),
    secondaryColor: AppColors.secondary.base,
    secondaryColorOverlay: AppColors.primary.base.darken(5),
    surfaceColor: AppColors.surface.light,
    surfaceColorStrong: AppColors.surface.lightStrong,
    cornerRadius: 8.0,
    lineStrokeThickness: 1,
    lineStrokeColor: AppColors.lineStroke.dark,
  );

  final AppThemeData darkTheme = AppThemeData(
    themeMode: ThemeMode.dark,
    primaryColor: AppColors.primary.base,
    primaryColorOverlay: AppColors.primary.base.darken(5),
    secondaryColor: AppColors.secondary.base,
    secondaryColorOverlay: AppColors.primary.base.darken(5),
    surfaceColor: AppColors.surface.light,
    surfaceColorStrong: AppColors.surface.lightStrong,
    cornerRadius: 8.0,
    lineStrokeThickness: 1,
    lineStrokeColor: AppColors.lineStroke.dark,
  );

// static ColorScheme lightScheme = ColorScheme(
//   primary: AppColors.primary.base,
//   primaryContainer: AppColors.primaryDark,
//   secondary: AppColors.secondary,
//   secondaryContainer: AppColors.secondaryLight,
//   surface: AppColors.bgComponentlightMode,
//   background: AppColors.surface.lightStrong,
//   error: AppColors.status.errorLightMode,
//   onPrimary: AppColors.whiteActive,
//   onSecondary: AppColors.whiteActive,
//   onSurface: AppColors.blackInactive,
//   onBackground: AppColors.blackInactive,
//   onError: AppColors.white,
//   brightness: Brightness.light,
// );

// static ThemeData lightTheme = ThemeData(
// brightness: AppColors.lightScheme.brightness,
// primaryColor: AppColors.lightScheme.primary,
// primaryColorBrightness:
//     ThemeData.estimateBrightnessForColor(AppColors.lightScheme.primary),
// canvasColor: AppColors.lightScheme.background,
// scaffoldBackgroundColor: AppColors.lightScheme.background,
// bottomAppBarColor: AppColors.lightScheme.surface,
// cardColor: AppColors.lightScheme.surface,
// dividerColor: AppColors.lightScheme.onSurface.withOpacity(0.12),
// backgroundColor: AppColors.lightScheme.background,
// dialogBackgroundColor: AppColors.lightScheme.background,
// errorColor: AppColors.lightScheme.error,
// indicatorColor: AppColors.lightScheme.onPrimary,
// applyElevationOverlayColor: false,
// colorScheme: AppColors.lightScheme,
// progressIndicatorTheme: ProgressIndicatorThemeData(
//   color: AppColors.lightScheme.secondary,
// ),
// );

// static ColorScheme darkScheme = ColorScheme(
// primary: AppColors.primary,
// primaryVariant: AppColors.primaryDark,
// secondary: AppColors.secondary,
// secondaryVariant: AppColors.secondaryLight,
// surface: AppColors.bgComponentDarkMode,
// background: AppColors.bgDarkMode,
// error: AppColors.status.errorDarkMode,
// onPrimary: AppColors.whiteActive,
// onSecondary: AppColors.whiteActive,
// onSurface: AppColors.whiteInactive,
// onBackground: AppColors.whiteInactive,
// onError: AppColors.whiteActive,
// brightness: Brightness.dark,
// );

// static ThemeData darkTheme = ThemeData(
// brightness: AppColors.darkScheme.brightness,
// primaryColor: AppColors.darkScheme.primary,
// primaryColorBrightness:
//     ThemeData.estimateBrightnessForColor(AppColors.darkScheme.primary),
// canvasColor: AppColors.darkScheme.background,
// scaffoldBackgroundColor: AppColors.darkScheme.background,
// bottomAppBarColor: AppColors.darkScheme.surface,
// cardColor: AppColors.darkScheme.surface,
// dividerColor: AppColors.darkScheme.onSurface.withOpacity(0.12),
// backgroundColor: AppColors.darkScheme.background,
// dialogBackgroundColor: AppColors.darkScheme.background,
// errorColor: AppColors.darkScheme.error,
// indicatorColor: AppColors.darkScheme.onPrimary,
// applyElevationOverlayColor: false,
// colorScheme: AppColors.darkScheme,
// progressIndicatorTheme: ProgressIndicatorThemeData(
//   color: AppColors.lightScheme.secondary,
// ),
// );
}
