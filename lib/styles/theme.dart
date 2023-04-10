import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/core/material_app.dart';

class AppThemeData {
  const AppThemeData({
    required this.themeMode,
    required this.primaryColor,
    required this.primaryColorOverlay,
    required this.secondaryColor,
    required this.secondaryColorOverlay,
    required this.surfaceColor,
    required this.surfaceColorStrong,
    required this.cornerRadius,
    required this.lineStrokeThickness,
    required this.lineStrokeColor,
  });

  final ThemeMode themeMode;
  final Color primaryColor;
  final Color primaryColorOverlay;
  final Color secondaryColor;
  final Color secondaryColorOverlay;

  final Color surfaceColor;
  final Color surfaceColorStrong;

  final double cornerRadius;

  final double lineStrokeThickness;
  final Color lineStrokeColor;

  ThemeData toThemeData() {
    final brightness;
    if (themeMode == ThemeMode.dark) {
      brightness = Brightness.dark;
    } else {
      brightness = Brightness.light;
    }

    return ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      dividerTheme: DividerThemeData(
        thickness: lineStrokeThickness,
        color: lineStrokeColor,
      ),
    );
  }
}
