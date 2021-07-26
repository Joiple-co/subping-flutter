import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Helper {
  static String setComma(num price) {
    return NumberFormat("###,###,###,###").format(price).replaceAll(" ", "");
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
