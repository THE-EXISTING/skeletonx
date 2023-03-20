import 'package:falconx/falconx.dart';

abstract class ApplicationX extends StatefulWidgetX {
  ApplicationX({required Key key}) : super(key: key) {
    setupBeforeRunApp();
  }

  Future<void> setupBeforeRunApp();
}
