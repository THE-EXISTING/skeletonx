import 'package:skeletonx/core/core.dart';

class AppToast {
  static init(BuildContext context) {}

  static Future<bool?> show(
    String message, {
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color? backgroundColor,
    Color? textColor,
    double fontSize = 16.0,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static Future<bool?> cancel() => Fluttertoast.cancel();
}
