import 'package:falconx/falconx.dart';

extension SvgIcons on String {
  Widget toSvg({
    Key? key,
    double height = 24,
    double width = 24,
    Color? color,
  }) =>
      SvgPicture.asset(
        this,
        height: height,
        width: width,
        color: color,
      );

  Widget toSvgIcon({Key? key, double size = 24, Color? color}) => //
      SvgPicture.asset(
        this,
        height: size,
        width: size,
        color: color,
      );
}
