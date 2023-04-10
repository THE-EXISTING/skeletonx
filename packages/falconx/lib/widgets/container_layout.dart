import 'package:falconx/falconx.dart';

class ContainerLayout extends StatelessWidget {
  const ContainerLayout({
    Key? key,
    this.direction = Axis.vertical,
    this.spacing = 0.0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.padding,
    this.cornerRadius,
    this.strokeThickness,
    this.strokeColor,
    this.child,
    this.children,
  }) : super(key: key);

  final Axis direction;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final EdgeInsets? padding;
  final double? cornerRadius;
  final double? strokeThickness;
  final Color? strokeColor;
  final Widget? child;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return _buildWidget(child!);
    } else {
      return _buildWidgetList(children!);
    }
  }

  ///========================= PRIVATE METHOD =========================///
  Widget _buildWidget(Widget child) => _buildContainer(child);

  Widget _buildWidgetList(List<Widget> children) {
    List<Widget> modifyWidgetList = _modifyWidgetList(children);
    Widget layout;
    switch (direction) {
      case Axis.horizontal:
        layout = Row(
          key: key,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: modifyWidgetList,
        );
        break;
      case Axis.vertical:
        layout = Column(
          key: key,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: modifyWidgetList,
        );
        break;
    }

    if (padding != null) {
      return Padding(
        padding: padding!,
        child: layout,
      );
    }
    return _buildContainer(layout);
  }

  Widget _buildContainer(Widget child) =>
      Container(
        decoration: BoxDecoration(
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: strokeColor ?? Colors.transparent,
              width: strokeThickness ?? 0.0,
            ),
            borderRadius: BorderRadius.circular(cornerRadius ?? 0.0)),
        // child: child,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 0.0)),
          child: child,
        ),
      );

  List<Widget> _modifyWidgetList(List<Widget> list) {
    if (spacing == 0.0) return list;
    return list.fold([], (list, element) {
      if (list.isNotEmpty) {
        list.add(_getSpace(spacing)); // Add separator
      }
      list.add(element);
      return list;
    });
  }

  Widget _getSpace(double space) {
    switch (direction) {
      case Axis.horizontal:
        return SizedBox(
          height: 0,
          width: space,
        );
      case Axis.vertical:
        return SizedBox(
          height: space,
          width: 0,
        );
    }
  }
}
