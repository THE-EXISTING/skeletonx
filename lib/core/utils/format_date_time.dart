import 'package:skeletonx/core/core.dart';

class FormatDateTime {
  static String checkDateTime(DateTime dateTime) {
    final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (dateTime.isAfter(today)) {
      return DateFormat('HH:mm').format(dateTime);
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else if (messageDate.difference(today).inDays < -356) {
      return DateFormat('dd/MM/yy').format(dateTime);
    } else {
      return DateFormat('dd/MM').format(dateTime);
    }
  }

  static String toFormat(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}
