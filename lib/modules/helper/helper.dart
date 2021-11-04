import 'package:intl/intl.dart';
import 'package:subping/const/const.dart';

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

    final diff = to.difference(from);

    if (diff.inMinutes < 1) {
      return "방금 전";
    } else if (diff.inHours < 1) {
      return '${diff.inMinutes}분 전';
    } else if (diff.inDays < 1) {
      return '${diff.inHours}시간 전';
    } else if (diff.inDays < 2) {
      return "어제";
    } else {
      return '${from.month}월 ${from.day}일';
    }
  }

  static String addPeriod(DateTime from, Period period) {
    DateTime date;

    if (period == Period.ONE_MONTH) {
      date = DateTime(from.year, from.month + 1, from.day);
    } else if (period == Period.TWO_MONTH) {
      date = DateTime(from.year, from.month + 2, from.day);
    } else if (period == Period.THREE_MONTH) {
      date = DateTime(from.year, from.month + 3, from.day);
    } else if (period == Period.ONE_WEEK) {
      date = DateTime(from.year, from.month, from.day + 7);
    } else if (period == Period.TWO_WEEK) {
      date = DateTime(from.year, from.month, from.day + 14);
    } else if (period == Period.THREE_WEEK) {
      date = DateTime(from.year, from.month, from.day + 21);
    } else {
      return "";
    }

    return "${date.year.toString()}년 ${date.month.toString().padLeft(2, '0')}월 ${date.day.toString().padLeft(2, '0')}일";
  }
}
