import 'package:skeletonx/core/core.dart';

class AppHoverSpreadShadow extends AppComponent {
  const AppHoverSpreadShadow(
      {Key? key,
      required this.child,
      required this.childCorner,
      this.spread = 4.0,
      this.focused = false,
      this.color})
      : super(key: key);

  final Widget child;
  final double childCorner;
  final double spread;
  final bool focused;
  final Color? color;

  @override
  Widget buildDefault(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(childCorner + spread / 2),
          ),
          boxShadow: [
            if (focused)
              BoxShadow(
                color: color != null
                    ? color!.withOpacity(0.3)
                    : primaryColor.withOpacity(0.3),
                spreadRadius: spread,
                blurRadius: 0,
                // offset: Offset(0, 0),
              )
          ],
        ),
        child: child);
  }
}
