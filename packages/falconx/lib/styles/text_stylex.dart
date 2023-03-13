import 'package:falconx/falconx.dart';

abstract class TextColorStyleX {
  const TextColorStyleX({
    required this.fontFamily,
    required this.fontWeight,
    required this.fontStyle,
    required this.fontSize,
    this.letterSpacing,
    this.lineHeight,
  });

  final String fontFamily;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double fontSize;
  final double? letterSpacing;
  final double? lineHeight;

  TextStyle get secondaryLight;

  TextStyle get primary;

  TextStyle get secondary;

  TextStyle get normal;

  TextStyle get blackActive;

  TextStyle get blackInactive;

  TextStyle get blackDisabled;

  TextStyle get blackDivider;

  TextStyle get whiteActive;

  TextStyle get whiteInactive;

  TextStyle get whiteDisabled;

  TextStyle get whiteDivider;

  TextStyle custom({
    required Color color,
    Paint? paint,
  });

  TextStyle createTextStyle({
    required Color color,
    Paint? paint,
  }) {
    return TextStyle(
      color: (paint == null) ? color : null,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontStyle: fontStyle,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: lineHeight == null ? null : lineHeight! / fontSize,
      foreground: paint,
    );
  }
}
