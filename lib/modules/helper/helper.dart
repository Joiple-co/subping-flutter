import 'package:intl/intl.dart';

class Helper {
  String setComma(num price) {
    return NumberFormat("###,###,###,###").format(price).replaceAll(" ", "");
  }
}
