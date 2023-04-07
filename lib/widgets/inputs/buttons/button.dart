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
    this.corner = AppStyle.corner,
    this.iconStart,
    this.iconEnd,
    this.destructive = false,
    required this.text,
    this.expanded = false,
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

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends AppComponentGroupLocaleState<AppButton> {
  @override
  Widget buildDefault(BuildContext context) {
    final iconSize = _getIconSize(widget.size);
    return ElevatedButton(
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      onHover: widget.onHover,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      style: ButtonStyle(
        padding: _resetPaddingStyle(),
        overlayColor: _createBackgroundStateStyle(context),
        shape: _createCornerStyle(),
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
          mainAxisSize: widget.expanded ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (widget.iconStart != null)
              widget.iconStart.toSvg(
                color: AppColors.white,
                height: iconSize,
                width: iconSize,
              ),
            if (widget.iconStart != null) Space.width8,
            Text(
              widget.text ?? '',
              style: _getTextStyle(widget.size, context),
              textAlign: TextAlign.center,
            ),
            if (widget.iconStart != null) Space.width8,
            if (widget.iconEnd != null)
              widget.iconEnd.toSvg(
                color: AppColors.white,
                height: iconSize,
                width: iconSize,
              ),
          ],
        ),
      ),
    );
  }

  ///========================= PRIVATE METHOD =========================///
  MaterialStateProperty<Color?> _createBackgroundStateStyle(
      BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return primaryColor.darken(5);
        } else if (states.contains(MaterialState.focused)) {
          return primaryColor;
        } else if (states.contains(MaterialState.pressed)) {
          return primaryColor.darken(10);
        } else if (states.contains(MaterialState.disabled)) {
          return primaryColor.withOpacity(0.5);
        } else {
          // Default state
          return primaryColor;
        }
      },
    );
  }

  MaterialStateProperty<Color?> _createOverlayStyle(BuildContext context) {
    return MaterialStateProperty.all<Color?>(Colors.transparent);
  }

  MaterialStateProperty<double?> _createElevatorStyle() =>
      MaterialStateProperty.all<double?>(0.0);

  MaterialStateProperty<OutlinedBorder> _createCornerStyle() {
    return MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.corner),
      ),
    );
  }

  TextStyle _getTextStyle(AppWidgetSize size, BuildContext context) {
    switch (size) {
      case AppWidgetSize.sm:
        return AppTextStyleBuilder.primaryText.sm.lightStrong.semiBold
            .build(context);
      case AppWidgetSize.md:
        return AppTextStyleBuilder.primaryText.sm.lightStrong.semiBold
            .build(context);
      case AppWidgetSize.lg:
        return AppTextStyleBuilder.primaryText.md.lightStrong.semiBold
            .build(context);
      case AppWidgetSize.xl:
        return AppTextStyleBuilder.primaryText.md.lightStrong.semiBold
            .build(context);
      case AppWidgetSize.xxl:
        return AppTextStyleBuilder.primaryText.lg.lightStrong.semiBold
            .build(context);
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
}
