import 'package:falconx/falconx.dart';

abstract class ApplicationX extends StatefulWidgetX {
  ApplicationX({required Key key}) : super(key: key) {
    setupApplication();
  }

  Future<void> setupApplication();
}
