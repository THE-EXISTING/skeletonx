import 'package:skeletonx/core/core.dart';

class AppBaseButtonGroup extends AppButton {
  AppBaseButtonGroup({
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
    Color? selectedBackgroundColor,
    bool selected = false,
  }) : super(
            key: key,
            text: text,
            onPressed: onPressed,
            textColor: textColor ?? AppColors.text.dark,
            iconColor: iconColor ?? AppColors.text.dark,
            stroke: 0.0,
            strokeColor: strokeColor ?? Colors.transparent,
            cornerRadius: 0.0,
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
            selectedBackgroundColor: AppColors.text.dark.withOpacity(0.05),
            enableSelected: true,
            selected: selected);
}
