import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle generateTextStyle(
    String size, FontWeight fontWeight, String colorCode) {}

const colorTable = {"a": Color.fromRGBO(10, 10, 10, 20)};

var style = {
  "color": {
    "red": Color.fromRGBO(10, 10, 10, 10),
    "blue": Color.fromRGBO(20, 20, 20, 20)
  },
};

const test = {"fontSize": 60, "fontWeight": FontWeight.bold};

TextStyle body = TextStyle(
  fontSize: test["fontSIze"],
  fontWeight: FontWeight.bold,
);

TextStyle tiny = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
