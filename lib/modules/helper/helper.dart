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
    DateTime to = DateTime.now();
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

  static String dateTimeToString(DateTime date) {
    return "${date.year.toString()}년 ${date.month.toString().padLeft(2, '0')}월 ${date.day.toString().padLeft(2, '0')}일";
  }

  static DateTime addPeriod(DateTime from, Period period, {num times = 1}) {
    DateTime date = from;

    for (var _ = 0; _ < times; _++) {
      if (period == Period.oneMonth) {
        date = DateTime(date.year, date.month + 1, date.day);
      } else if (period == Period.twoMonth) {
        date = DateTime(date.year, date.month + 2, date.day);
      } else if (period == Period.threeMonth) {
        date = DateTime(date.year, date.month + 3, date.day);
      } else if (period == Period.oneWeek) {
        date = DateTime(date.year, date.month, date.day + 7);
      } else if (period == Period.twoWeek) {
        date = DateTime(date.year, date.month, date.day + 14);
      } else if (period == Period.threeWeek) {
        date = DateTime(date.year, date.month, date.day + 21);
      } else {
        throw "PeriodException";
      }
    }

    return date;
  }
}
