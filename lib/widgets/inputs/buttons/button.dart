import 'package:skeletonx/core/core.dart';

enum AppButtonType {
  solidPrimary,
  solidSecondary,
  outlinePrimary,
  outlineSecondary,
  outlineGray,
  ghostPrimary,
  ghostSecondary,
  ghostGray,
  linkPrimary,
  linkSecondary,
  linkGray,
}

class AppButton extends AppComponentGroup {
  const AppButton({
    key,
    this.type = AppButtonType.solidPrimary,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.size = AppWidgetSize.md,
    this.corner = AppStyle.globalCorner,
    this.iconStart,
    this.iconEnd,
    this.destructive = false,
    required this.text,
    this.expanded = false,
    this.enabled = true,
  }) : super(key: key);

  final AppButtonType type;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? text;
  final AppWidgetSize size;
  final double corner;
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
    final iconColor = _getTextColor(context, widget.type);
    return AppHoverSpreadShadow(
      childCorner: widget.corner,
      focused: focused,
      color: _getMainColor(context, widget.type).withOpacity(0.2),
      child: Opacity(
        opacity: widget.enabled ? 1.0 : 0.5,
        child: ElevatedButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          onLongPress: widget.onLongPress,
          onHover: widget.onHover,
          focusNode: widget.focusNode,
          onFocusChange: _onFocusChange,
          autofocus: widget.autofocus,
          clipBehavior: widget.clipBehavior,
          style: ButtonStyle(
            padding: _resetPaddingStyle(),
            overlayColor: _createOverlayStateStyle(context, widget.type),
            backgroundColor: _createBackgroundStyle(context, widget.type),
            shape: _createShapeStyle(context, widget.type),
            elevation: _createElevatorStyle(),
            //Disabled ripple effect
            splashFactory: NoSplash.splashFactory,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: _getVerticalMargin(widget.size),
              horizontal: _getHorizontalMargin(widget.size),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize:
                  widget.expanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (widget.iconStart != null)
                  widget.iconStart.toSvg(
                    color: iconColor,
                    height: iconSize,
                    width: iconSize,
                  ),
                if (widget.iconStart != null) Space.width8,
                Text(
                  widget.text ?? '',
                  style: _getTextStyle(widget.size, context, widget.type),
                ),
                if (widget.iconStart != null) Space.width8,
                if (widget.iconEnd != null)
                  widget.iconEnd.toSvg(
                    color: iconColor,
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
  MaterialStateProperty<Color?> _createBackgroundStyle(
          BuildContext context, AppButtonType type) =>
      MaterialStateProperty.all<Color?>(_getBackgroundColor(context, type));

  MaterialStateProperty<Color?> _createOverlayStateStyle(
      BuildContext context, AppButtonType type) {
    return MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          if (type == AppButtonType.solidPrimary ||
              type == AppButtonType.solidSecondary) {
            return _getMainColor(context, type).darken(5);
          } else if (type == AppButtonType.outlinePrimary ||
              type == AppButtonType.outlineSecondary ||
              type == AppButtonType.outlineGray ||
              type == AppButtonType.ghostPrimary ||
              type == AppButtonType.ghostSecondary ||
              type == AppButtonType.ghostGray ||
              type == AppButtonType.linkPrimary ||
              type == AppButtonType.linkSecondary ||
              type == AppButtonType.linkGray) {
            return _getMainColor(context, type).withOpacity(0.05);
          } else {
            return AppColors.transparent;
          }
        } else if (states.contains(MaterialState.focused)) {
          return _getBackgroundColor(context, type);
        } else if (states.contains(MaterialState.pressed)) {
          if (type == AppButtonType.solidPrimary ||
              type == AppButtonType.solidSecondary) {
            return _getMainColor(context, type).darken(10);
          } else if (type == AppButtonType.outlinePrimary ||
              type == AppButtonType.outlineSecondary ||
              type == AppButtonType.outlineGray ||
              type == AppButtonType.ghostPrimary ||
              type == AppButtonType.ghostSecondary ||
              type == AppButtonType.ghostGray ||
              type == AppButtonType.linkPrimary ||
              type == AppButtonType.linkSecondary ||
              type == AppButtonType.linkGray) {
            return _getMainColor(context, type).withOpacity(0.10);
          } else {
            return AppColors.transparent;
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
      BuildContext context, AppButtonType type) {
    return MaterialStateProperty.resolveWith<OutlinedBorder?>((states) {
      return RoundedRectangleBorder(
        side: BorderSide(
            color: _getStrokeColor(context, type, states),
            width: 1,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignInside),
        borderRadius: BorderRadius.circular(widget.corner),
      );
    });
  }

  TextStyle _getTextStyle(
    AppWidgetSize size,
    BuildContext context,
    AppButtonType type,
  ) {
    AppTextStyleBuilder styleBuilder =
        AppTextStyleBuilder.primaryText.color(_getTextColor(context, type));
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

  MaterialStateProperty<EdgeInsetsGeometry> _resetPaddingStyle() {
    return MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 0,
    ));
  }

  ///========================= COLOR METHOD =========================///
  Color _getBackgroundColor(
    BuildContext context,
    AppButtonType type,
  ) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = AppColors.secondary.base;
    if (type == AppButtonType.solidPrimary) {
      return primaryColor;
    } else if (type == AppButtonType.solidSecondary) {
      return secondaryColor;
    } else if (type == AppButtonType.outlinePrimary ||
        type == AppButtonType.outlineSecondary ||
        type == AppButtonType.outlineGray ||
        type == AppButtonType.ghostPrimary ||
        type == AppButtonType.ghostSecondary ||
        type == AppButtonType.ghostGray ||
        type == AppButtonType.linkPrimary ||
        type == AppButtonType.linkSecondary ||
        type == AppButtonType.linkGray) {
      return AppColors.transparent;
    } else {
      return AppColors.transparent;
    }
  }

  Color _getTextColor(
    BuildContext context,
    AppButtonType type,
  ) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = AppColors.secondary.base;
    switch (type) {
      case AppButtonType.solidPrimary:
        return AppColors.text.lightStronger;
      case AppButtonType.solidSecondary:
        return AppColors.text.lightStronger;
      case AppButtonType.outlinePrimary:
        return primaryColor;
      case AppButtonType.outlineSecondary:
        return secondaryColor;
      case AppButtonType.outlineGray:
        return AppColors.text.dark;
      case AppButtonType.ghostPrimary:
        return primaryColor;
      case AppButtonType.ghostSecondary:
        return secondaryColor;
      case AppButtonType.ghostGray:
        return AppColors.text.dark;
      case AppButtonType.linkPrimary:
        return primaryColor;
      case AppButtonType.linkSecondary:
        return secondaryColor;
      case AppButtonType.linkGray:
        return AppColors.text.dark;
    }
  }

  Color _getStrokeColor(
    BuildContext context,
    AppButtonType type, Set<MaterialState> states,
  ) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = AppColors.secondary.base;
    if (type == AppButtonType.solidPrimary ||
        type == AppButtonType.solidSecondary ||
        type == AppButtonType.ghostSecondary ||
        type == AppButtonType.linkSecondary) {
      return AppColors.transparent;
    } else if (type == AppButtonType.outlinePrimary) {
      return primaryColor;
    } else if (type == AppButtonType.outlineSecondary) {
      return secondaryColor;
    } else if (type == AppButtonType.outlineGray) {
      if (states.contains(MaterialState.hovered)) {
        return AppColors.lineStroke.dark.darken(10);
      }else{
        return AppColors.lineStroke.dark;
      }
    } else {
      return AppColors.transparent;
    }
  }

  Color _getMainColor(
    BuildContext context,
    AppButtonType type,
  ) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = AppColors.secondary.base;
    if (type == AppButtonType.solidPrimary ||
        type == AppButtonType.outlinePrimary ||
        type == AppButtonType.ghostPrimary ||
        type == AppButtonType.linkPrimary) {
      return primaryColor;
    } else if (type == AppButtonType.solidSecondary ||
        type == AppButtonType.outlineSecondary ||
        type == AppButtonType.ghostSecondary ||
        type == AppButtonType.linkSecondary) {
      return secondaryColor;
    } else if (type == AppButtonType.outlineGray ||
        type == AppButtonType.ghostGray ||
        type == AppButtonType.linkGray) {
      return AppColors.text.dark;
    } else {
      return AppColors.transparent;
    }
  }

  ///========================= CALLBACK METHOD =========================///
  void _onFocusChange(bool value) {
    focused = value;
    widget.onFocusChange?.call(value);
    updateState();
  }
}
