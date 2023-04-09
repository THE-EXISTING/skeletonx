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
    required this.children,
  }) : super(key: key);

  final Axis direction;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final EdgeInsets? padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
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
    return layout;
  }

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
