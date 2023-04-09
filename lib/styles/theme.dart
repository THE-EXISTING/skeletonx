import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/core/material_app.dart';

class AppThemeData {
  const AppThemeData({
    required this.themeMode,
    required this.primaryColor,
    required this.secondaryColor,
    required this.cornerRadius,
    required this.lineStrokeThickness,
    required this.lineStrokeColor,
  });

  final ThemeMode themeMode;
  final Color primaryColor;
  final Color secondaryColor;

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
      dividerTheme: DividerThemeData(
        thickness: lineStrokeThickness,
        color: lineStrokeColor,
      ),
    );
  }
}
