import 'package:skeletonx/core/core.dart';
export 'solids/solid_button.dart';
export 'solids/solid_light_button.dart';
export 'solids/solid_light_secondary_button.dart';
export 'outlines/outline_button.dart';
export 'close_button.dart';
export 'social_button.dart';
export 'icon_button.dart';
export 'toggle_button.dart';
export 'solids/solid_secondary_button.dart';
export 'outlines/outline_secondary_button.dart';
export 'outlines/outline_gray_button.dart';
export 'ghosts/ghost_button.dart';
export 'ghosts/ghost_secondary_button.dart';
export 'ghosts/ghost_gray_button.dart';
export 'links/link_button.dart';
export 'links/link_secondary_button.dart';
export 'links/link_gray_button.dart';
export 'groups/group_button_item.dart';
export 'groups/base_group_button.dart';

class AppButton extends AppComponentGroup {
  const AppButton({
    key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.iconColor,
    this.stroke,
    this.strokeColor,
    this.cornerRadius,
    this.backgroundColor,
    this.overlayColor,
    this.focusColor,
    this.padding,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.size = AppWidgetSize.md,
    this.iconStart,
    this.iconEnd,
    this.selectedBackgroundColor,
    this.enableSelected = false,
    this.selected = false,
    this.destructive = false,
    this.expanded = false,
    this.enabled = true,
  }) : super(key: key);

  final String? text;
  final AppWidgetSize size;
  final Color? textColor;
  final Color? iconColor;
  final double? stroke;
  final Color? strokeColor;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Color? focusColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final double? cornerRadius;
  final Clip clipBehavior;
  final String? iconStart;
  final String? iconEnd;
  final bool expanded;
  final bool destructive;
  final bool enabled;

  final Color? selectedBackgroundColor;
  final bool enableSelected;
  final bool selected;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends AppComponentGroupLocaleState<AppButton> {
  bool focused = false;

  @override
  Widget buildDefault(BuildContext context) {
    final iconSize = _getIconSize(widget.size);
    final backgroundColor = widget.backgroundColor ?? theme.primaryColor;
    final overlayColor = widget.overlayColor ?? theme.primaryColorOverlay;
    final stroke = widget.stroke ?? theme.lineStrokeThickness;
    final strokeColor = widget.strokeColor ?? theme.lineStrokeColor;
    final cornerRadius = widget.cornerRadius ?? theme.cornerRadius;
    final focusColor =
        widget.focusColor ?? widget.overlayColor?.withOpacity(0.1);
    final height = _calculateHeight(widget.size);
    final Color? selectedColorBackground = widget.selectedBackgroundColor;
    final selected = widget.enableSelected && widget.selected;
    return AppHoverSpreadShadow(
      childCorner: widget.cornerRadius ?? theme.cornerRadius,
      focused: focused,
      color: focusColor,
      child: Opacity(
        opacity: widget.enabled ? 1.0 : 0.5,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height, minHeight: height),
          child: ElevatedButton(
            onPressed: widget.enabled ? widget.onPressed : null,
            onLongPress: widget.onLongPress,
            onHover: widget.onHover,
            focusNode: widget.focusNode,
            onFocusChange: _onFocusChange,
            autofocus: widget.autofocus,
            clipBehavior: widget.clipBehavior,
            style: ButtonStyle(
              padding: _createPaddingStyle(widget.size),
              overlayColor: _createOverlayStateStyle(
                context,
                backgroundColor: backgroundColor,
                overlayColor: overlayColor,
              ),
              backgroundColor: _createBackgroundStyle(
                context,
                backgroundColor: backgroundColor,
                selectedColor: selectedColorBackground,
                selected: selected,
              ),
              shape: _createShapeStyle(
                context,
                stroke: stroke,
                strokeColor: strokeColor,
                cornerRadius: cornerRadius,
              ),
              elevation: _createElevatorStyle(),
              //Disabled ripple effect
              splashFactory: NoSplash.splashFactory,
              minimumSize: MaterialStateProperty.all<Size>(const Size(10, 36)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize:
                  widget.expanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (widget.iconStart != null)
                  widget.iconStart.toSvg(
                    color: widget.iconColor,
                    height: iconSize,
                    width: iconSize,
                  ),
                if (widget.iconStart != null) Space.width8,
                Text(
                  widget.text ?? '',
                  style: _getTextStyle(widget.size, context),
                ),
                if (widget.iconEnd != null) Space.width8,
                if (widget.iconEnd != null)
                  widget.iconEnd.toSvg(
                    color: widget.iconColor,
                    height: iconSize,
                    width: iconSize,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///========================= BUTTON STYLE METHOD =========================///

  MaterialStateProperty<EdgeInsetsGeometry> _createPaddingStyle(
      AppWidgetSize size) {
    return MaterialStateProperty.all<EdgeInsetsGeometry>(widget.padding ??
        EdgeInsets.symmetric(
          vertical: _getVerticalMargin(size),
          horizontal: _getHorizontalMargin(size),
        ));
  }

  MaterialStateProperty<Color?> _createBackgroundStyle(
    BuildContext context, {
    required Color backgroundColor,
    required bool selected,
    required Color? selectedColor,
  }) =>
      MaterialStateProperty.all<Color?>(selected
          ? (selectedColor ?? backgroundColor.darken(10))
          : backgroundColor);

  MaterialStateProperty<Color?> _createOverlayStateStyle(
    BuildContext context, {
    required Color backgroundColor,
    required Color overlayColor,
  }) {
    return MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          if (backgroundColor.value == Colors.transparent.value) {
            return overlayColor.withOpacity(0.05);
          } else {
            return overlayColor.darken(5);
          }
        } else if (states.contains(MaterialState.focused)) {
          return backgroundColor;
        } else if (states.contains(MaterialState.pressed)) {
          if (backgroundColor.value == Colors.transparent.value) {
            return overlayColor.withOpacity(0.1);
          } else {
            return overlayColor.darken(10);
          }
        } else {
          return null;
        }
      },
    );
  }

  MaterialStateProperty<double?> _createElevatorStyle() =>
      MaterialStateProperty.all<double?>(0.0);

  MaterialStateProperty<OutlinedBorder?> _createShapeStyle(
    BuildContext context, {
    required double stroke,
    required Color strokeColor,
    required double cornerRadius,
  }) {
    return MaterialStateProperty.resolveWith<OutlinedBorder?>((states) {
      Color strokeColorTmp = strokeColor;
      if (states.contains(MaterialState.hovered)) {
        strokeColorTmp = strokeColor.darken(5);
      } else if (states.contains(MaterialState.focused)) {
        strokeColorTmp = strokeColor;
      } else if (states.contains(MaterialState.pressed)) {
        strokeColorTmp = strokeColor.darken(10);
      }
      return RoundedRectangleBorder(
        side: BorderSide(
          color: strokeColorTmp,
          width: stroke,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        borderRadius: BorderRadius.circular(cornerRadius),
      );
    });
  }

  TextStyle _getTextStyle(AppWidgetSize size, BuildContext context) {
    AppTextStyleBuilder styleBuilder =
        AppTextStyleBuilder.primaryText.color(widget.textColor);
    switch (size) {
      case AppWidgetSize.sm:
        return styleBuilder.sm.semiBold.build(context);
      case AppWidgetSize.md:
        return styleBuilder.sm.semiBold.build(context);
      case AppWidgetSize.lg:
        return styleBuilder.md.semiBold.build(context);
      case AppWidgetSize.xl:
        return styleBuilder.md.semiBold.build(context);
      case AppWidgetSize.xxl:
        return styleBuilder.lg.semiBold.build(context);
      default:
        throw UnimplementedError('No button size!');
    }
  }

  double _getIconSize(AppWidgetSize size) {
    switch (size) {
      case AppWidgetSize.sm:
        return 20.0;
      case AppWidgetSize.md:
        return 20.0;
      case AppWidgetSize.lg:
        return 20.0;
      case AppWidgetSize.xl:
        return 20.0;
      case AppWidgetSize.xxl:
        return 24.0;
      default:
        throw UnimplementedError('No button size!');
    }
  }

  double _getHorizontalMargin(AppWidgetSize size) {
    switch (size) {
      case AppWidgetSize.sm:
        return 14.0;
      case AppWidgetSize.md:
        return 16.0;
      case AppWidgetSize.lg:
        return 18.0;
      case AppWidgetSize.xl:
        return 20.0;
      case AppWidgetSize.xxl:
        return 28.0;
      default:
        throw UnimplementedError('No button size!');
    }
  }

  double _getVerticalMargin(AppWidgetSize size) {
    switch (size) {
      case AppWidgetSize.sm:
        return 8.0;
      case AppWidgetSize.md:
        return 10.0;
      case AppWidgetSize.lg:
        return 10.0;
      case AppWidgetSize.xl:
        return 12.0;
      case AppWidgetSize.xxl:
        return 16.0;
      default:
        throw UnimplementedError('No button size!');
    }
  }

  double _calculateHeight(AppWidgetSize size) {
    final textStyle = _getTextStyle(size, context);
    final fontHeight = (textStyle.height ?? 0.0) * (textStyle.fontSize ?? 0.0);
    final List<double> values = [fontHeight, _getIconSize(size)];
    double maxValue = values.reduce(max);
    final verticalPadding =
        (widget.padding?.vertical ?? _getVerticalMargin(size)) * 2;
    return verticalPadding + maxValue;
  }

  ///========================= CALLBACK METHOD =========================///
  void _onFocusChange(bool value) {
    focused = value;
    widget.onFocusChange?.call(value);
    updateState();
  }
}
