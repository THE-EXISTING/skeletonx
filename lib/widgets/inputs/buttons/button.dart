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

class AppButton extends AppComponentGroup {
  const AppButton({
    key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.iconColor,
    this.stroke,
    this.strokeColor,
    this.corner,
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
  final double? corner;
  final Clip clipBehavior;
  final String? iconStart;
  final String? iconEnd;
  final bool expanded;
  final bool destructive;
  final bool enabled;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends AppComponentGroupLocaleState<AppButton> {
  bool focused = false;

  @override
  Widget buildDefault(BuildContext context) {
    final iconSize = _getIconSize(widget.size);
    return AppHoverSpreadShadow(
      childCorner: widget.corner ?? 4.0,
      focused: focused,
      color: widget.focusColor ?? widget.overlayColor?.withOpacity(0.2),
      child: Opacity(
        opacity: widget.enabled ? 1.0 : 0.5,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: _calculateHeight(widget.size)),
          // constraints: BoxConstraints(),
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
              overlayColor: _createOverlayStateStyle(context),
              backgroundColor: _createBackgroundStyle(context),
              shape: _createShapeStyle(context),
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

  MaterialStateProperty<Color?> _createBackgroundStyle(BuildContext context) =>
      MaterialStateProperty.all<Color?>(widget.backgroundColor);

  MaterialStateProperty<Color?> _createOverlayStateStyle(BuildContext context) {
    return MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          if (widget.backgroundColor?.value == Colors.transparent.value) {
            return widget.overlayColor?.withOpacity(0.05);
          } else {
            return widget.overlayColor?.darken(5);
          }
        } else if (states.contains(MaterialState.focused)) {
          return widget.backgroundColor;
        } else if (states.contains(MaterialState.pressed)) {
          if (widget.backgroundColor?.value == Colors.transparent.value) {
            return widget.overlayColor?.withOpacity(0.1);
          } else {
            return widget.overlayColor?.darken(10);
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
      BuildContext context) {
    return MaterialStateProperty.resolveWith<OutlinedBorder?>((states) {
      Color strokeColor = widget.strokeColor ?? Colors.transparent;
      if (states.contains(MaterialState.hovered)) {
        strokeColor = strokeColor.darken(5);
      } else if (states.contains(MaterialState.focused)) {
        strokeColor = strokeColor;
      } else if (states.contains(MaterialState.pressed)) {
        strokeColor = strokeColor.darken(10);
      }
      return RoundedRectangleBorder(
        side: BorderSide(
            color: strokeColor,
            width: widget.stroke ?? 1.0,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignInside),
        borderRadius: BorderRadius.circular(widget.corner ?? 4.0),
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
