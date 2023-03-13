import 'package:falconx/falconx.dart';

extension SvgIcons on String {
  Widget toSvg({
    Key? key,
    double height = 24,
    double width = 24,
    Color? color,
    String? label,
  }) =>
      SvgPicture.asset(
        this,
        height: height,
        width: width,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        semanticsLabel: label,
      );
}
