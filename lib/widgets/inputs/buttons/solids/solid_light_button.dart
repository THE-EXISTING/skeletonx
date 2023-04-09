import 'package:skeletonx/core/core.dart';

class AppSolidLightButton extends AppButton {
  AppSolidLightButton({
    key,
    required String text,
    required VoidCallback onPressed,
    AppWidgetSize size = AppWidgetSize.md,
    Color? textColor,
    Color? iconColor,
    double? stroke,
    Color? strokeColor,
    double? corner,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    String? iconStart,
    String? iconEnd,
    bool destructive = false,
    bool expanded = false,
    bool enabled = true,
  }) : super(
          key: key,
          text: text,
          onPressed: onPressed,
          textColor: textColor ?? AppColors.primary.base,
          iconColor: iconColor ?? AppColors.primary.base,
          stroke: stroke ?? 0.0,
          strokeColor: strokeColor ?? Colors.transparent,
          corner: corner,
          backgroundColor: backgroundColor ?? AppColors.primary.bgStrong,
          overlayColor:
              backgroundColor ?? AppColors.primary.bg.withOpacity(0.4),
          focusColor: backgroundColor ?? AppColors.primary.base,
          padding: padding,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          size: size,
          iconStart: iconStart,
          iconEnd: iconEnd,
          destructive: destructive,
          expanded: expanded,
          enabled: enabled,
        );
}
