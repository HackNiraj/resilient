import 'package:intl/intl.dart';

class DateTimeDirectory {
  String getVerboseDateTimeRepresentation(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime localDateTime = dateTime.toLocal();
    if (!localDateTime.difference(now.subtract(Duration(minutes: 1))).isNegative) {
      return 'Now';
    }
    if (!localDateTime.difference(now.subtract(Duration(minutes: 45))).isNegative) {
      return 'Few minutes';
    }
    if (!localDateTime.difference(now.subtract(Duration(hours: 1, minutes: 15))).isNegative) {
      return 'An hour';
    }
    if (!localDateTime.difference(now.subtract(Duration(hours: 3))).isNegative) {
      return 'Few hours';
    }
    if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return "Today";
    }
    DateTime yesterday = now.subtract(Duration(days: 1));
    if (localDateTime.day == yesterday.day && localDateTime.month == yesterday.month && localDateTime.year == yesterday.year) {
      return 'Yesterday';
    }
    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(localDateTime);
      return '$weekday';
    }
    return '${DateFormat('yMd').format(dateTime)}';
  }
}