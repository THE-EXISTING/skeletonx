import 'package:falconx/falconx.dart';

abstract class TextColorStyleX extends TextStyle {
  const TextColorStyleX({
    required String fontFamily,
    required FontWeight fontWeight,
    required FontStyle fontStyle,
    required double fontSize,
    double? letterSpacing,
    double? lineHeight,
    Paint? paint,
  }) : super(
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            height: lineHeight,
            foreground: paint);

  TextStyle get primary;

  TextStyle get secondary;

  TextStyle get lightWeaker;

  TextStyle get lightWeak;

  TextStyle get light;

  TextStyle get lightStrong;

  TextStyle get darkWeaker;

  TextStyle get darkWeak;

  TextStyle get dark;

  TextStyle get darkStrong;

  TextStyle custom({
    required Color color,
    Paint? paint,
  });

  TextStyle createTextStyle({
    required Color color,
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? fontSize,
    double? letterSpacing,
    double? lineHeight,
    Paint? paint,
  }) {
    return super.copyWith(
      color: (paint == null) ? color : null,
      fontWeight: fontWeight ?? this.fontWeight,
      fontFamily: fontFamily ?? this.fontFamily,
      fontStyle: fontStyle ?? this.fontStyle,
      fontSize: fontSize ?? this.fontSize,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      // height: lineHeight == null ? null : lineHeight! / fontSize!,
      height: lineHeight ?? height,
      foreground: paint ?? foreground,
    );
  }
}
