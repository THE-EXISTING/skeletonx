import 'package:skeletonx/core/core.dart';

enum DividerDirection { vertical, horizontal }

class AppDivider extends AppComponent {
  const AppDivider._({
    required this.direction,
    required this.color,
    this.paddingSymmetry,
    this.paddingStart,
    this.paddingEnd,
  });

  final DividerDirection direction;
  final Color color;
  final double? paddingSymmetry;
  final double? paddingStart;
  final double? paddingEnd;

  static AppDivider horizontalBlack({
    double? paddingSymmetry,
    double? paddingStart,
    double? paddingEnd,
  }) =>
      AppDivider._(
        direction: DividerDirection.horizontal,
        color: AppColors.tran.black10,
        paddingSymmetry: paddingSymmetry,
        paddingStart: paddingStart,
        paddingEnd: paddingEnd,
      );

  static AppDivider horizontalWhite({
    double? paddingSymmetry,
    double? paddingStart,
    double? paddingEnd,
  }) =>
      AppDivider._(
        direction: DividerDirection.horizontal,
        color: AppColors.tran.white15,
        paddingSymmetry: paddingSymmetry,
        paddingStart: paddingStart,
        paddingEnd: paddingEnd,
      );

  static AppDivider verticalWhite({
    double? paddingSymmetry,
    double? paddingStart,
    double? paddingEnd,
  }) =>
      AppDivider._(
        direction: DividerDirection.vertical,
        color: AppColors.tran.white15,
        paddingSymmetry: paddingSymmetry,
        paddingStart: paddingStart,
        paddingEnd: paddingEnd,
      );

  static AppDivider verticalBlack({
    double? paddingSymmetry,
    double? paddingStart,
    double? paddingEnd,
  }) =>
      AppDivider._(
        direction: DividerDirection.vertical,
        color: AppColors.tran.black10,
        paddingSymmetry: paddingSymmetry,
        paddingStart: paddingStart,
        paddingEnd: paddingEnd,
      );

  @override
  Widget buildDefault(BuildContext context) {
    return Container(
      margin: paddingSymmetry != null
          ? EdgeInsets.symmetric(
              vertical: direction == DividerDirection.horizontal
                  ? 0
                  : paddingSymmetry ?? 0,
              horizontal: direction == DividerDirection.horizontal
                  ? paddingSymmetry ?? 0
                  : 0,
            )
          : EdgeInsets.only(
              bottom:
                  direction == DividerDirection.horizontal ? 0 : paddingEnd ?? 0,
              left:
                  direction == DividerDirection.horizontal ? paddingStart ?? 0 : 0,
              right: direction == DividerDirection.horizontal ? paddingEnd ?? 0 : 0,
              top: direction == DividerDirection.horizontal ? 0 : paddingStart ?? 0,
            ),
      height: direction == DividerDirection.horizontal ? 1 : double.infinity,
      width: direction == DividerDirection.horizontal ? double.infinity : 1,
      color: color,
    );
  }
}
