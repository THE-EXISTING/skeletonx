import 'package:falconx/falconx.dart';

abstract class StatelessWidgetX extends StatelessWidget {
  String get tag => runtimeType.toString();

  const StatelessWidgetX({
    Key? key,
  }) : super(key: key);
}
