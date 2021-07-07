import 'package:intl/intl.dart';

class Helper {
  static String setComma(num price) {
    return NumberFormat("###,###,###,###").format(price).replaceAll(" ", "");
  }
}
