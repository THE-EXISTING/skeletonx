import 'package:faltool/faltool.dart';
import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => screenSize.height;

  double get screenWidth => screenSize.width;
}
