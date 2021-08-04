import 'package:intl/intl.dart';

class Helper {
  static String setComma(num price) {
    return NumberFormat("###,###,###,###").format(price).replaceAll(" ", "");
  }

  static bool isSameDay(DateTime to, DateTime from) {
    return (to.year == from.year &&
        to.month == from.month &&
        to.day == from.day);
  }

  static String refineDate(String date) {
    DateTime to = new DateTime.now();
    DateTime from = DateTime.parse(date);

    if (isSameDay(to, from)) {
      return '${from.hour}시 ${from.minute}분';
    } else if (isSameDay(from.add(Duration(days: 1)), from)) {
      return "어제";
    } else {
      return '${from.month}월 ${from.day}';
    }
  }
}
