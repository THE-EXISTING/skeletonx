import 'package:skeletonx/core/core.dart';

class AppGhostGrayButton extends AppButton {
  AppGhostGrayButton({
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
          textColor: textColor ?? AppColors.text.dark,
          iconColor: iconColor ?? AppColors.text.dark,
          stroke: stroke ?? 1.0,
          strokeColor: strokeColor ?? Colors.transparent,
          cornerRadius: corner,
          backgroundColor: backgroundColor ?? Colors.transparent,
          overlayColor: backgroundColor ?? AppColors.text.dark,
          focusColor: backgroundColor ?? AppColors.text.dark.lighten(30),
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