import 'package:skeletonx/core/core.dart';

class AppLoadingSkeleton extends SkeletonX {
  AppLoadingSkeleton._({
    required double width,
    required double height,
    required Color color,
    required BorderRadius borderRadius,
    required BoxShape boxShape,
  }) : super(
            width: width,
            height: height,
            color: color,
            borderRadius: borderRadius,
            boxShape: boxShape);

  static Widget rect({
    required double width,
    required double height,
    required Color color,
    BorderRadius? borderRadius,
  }) =>
      AppLoadingSkeleton._(
        boxShape: BoxShape.rectangle,
        width: width,
        height: height,
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      );

  static Widget circle({
    required double size,
    required Color color,
  }) =>
      AppLoadingSkeleton._(
        boxShape: BoxShape.circle,
        width: size,
        height: size,
        color: color,
        borderRadius: BorderRadius.circular(0),
      );
}
