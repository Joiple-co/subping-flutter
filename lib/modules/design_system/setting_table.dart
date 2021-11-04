import 'package:flutter/material.dart';

enum BlankType { alarm }

enum SubpingSizeExtension {
  large80,
  large70,
  large64,
  large56,
  large50,
  large48,
  large40,
  large30,
  medium28,
  medium24,
  medium22,
  medium20,
  medium16,
  tiny14,
  tiny12,
  tiny10,
}

enum SubpingColorExtension {
  subping100,
  subping50,
  subping30,
  warning100,
  black100,
  black80,
  black60,
  black30,
  back20,
  white100,
}

enum SubpingFontSizeExtension {
  title1,
  title2,
  title3,
  title4,
  title5,
  title6,
  body1,
  body2,
  body3,
  body4,
  body5,
  tiny1,
}

enum SubpingFontWeightExtionsion { bold, medium, regular }

extension BlankTypeStatus on BlankType {
  static Map<String, dynamic> get alarm {
    return {
      "resource": "assets/alarmIcon/blank_alarm.png",
      "shortPhrases": "아직 알람이 없어요",
    };
  }
}

extension SubpingSize on SubpingSizeExtension {
  static double get large40 {
    return 40;
  }

  static double get large35 {
    return 35;
  }

  static double get large32 {
    return 32;
  }

  static double get large28 {
    return 28;
  }

  static double get large25 {
    return 25;
  }

  static double get large24 {
    return 24;
  }

  static double get large20 {
    return 20;
  }

  static double get large15 {
    return 15;
  }

  static double get medium14 {
    return 14;
  }

  static double get medium12 {
    return 12;
  }

  static double get medium11 {
    return 11;
  }

  static double get medium10 {
    return 10;
  }

  static double get medium8 {
    return 8;
  }

  static double get tiny7 {
    return 7;
  }

  static double get tiny6 {
    return 6;
  }

  static double get tiny5 {
    return 5;
  }
}

extension SubpingFontSize on SubpingFontSizeExtension {
  static double get title1 {
    return 31;
  }

  static double get title2 {
    return 30;
  }

  static double get title3 {
    return 26;
  }

  static double get title4 {
    return 23;
  }

  static double get title5 {
    return 21;
  }

  static double get title6 {
    return 18;
  }

  static double get body1 {
    return 16;
  }

  static double get body2 {
    return 15;
  }

  static double get body3 {
    return 14;
  }

  static double get body4 {
    return 13;
  }

  static double get body5 {
    return 12;
  }

  static double get tiny1 {
    return 11;
  }
}

extension SubpingColor on SubpingColorExtension {
  static Color get subping100 {
    return const Color.fromRGBO(80, 110, 225, 1);
  }

  static Color get subpingAlpha {
    return const Color.fromRGBO(80, 110, 225, 0.1);
  }

  static Color get subping50 {
    return const Color.fromRGBO(80, 140, 255, 1);
  }

  static Color get subping30 {
    return const Color.fromRGBO(180, 209, 255, 1);
  }

  static Color get warning100 {
    return const Color.fromRGBO(250, 60, 90, 1);
  }

  static Color get black100 {
    return const Color.fromRGBO(20, 20, 20, 1);
  }

  static Color get black80 {
    return const Color.fromRGBO(85, 85, 95, 1);
  }

  static Color get black60 {
    return const Color.fromRGBO(170, 176, 195, 1);
  }

  static Color get black30 {
    return const Color.fromRGBO(233, 233, 238, 1);
  }

  static Color get back20 {
    return const Color.fromRGBO(246, 246, 247, 1);
  }

  static Color get white100 {
    return const Color.fromRGBO(255, 255, 255, 1);
  }
}

extension SubpingFontWeight on SubpingFontWeightExtionsion {
  static FontWeight get bold {
    return FontWeight.bold;
  }

  static FontWeight get medium {
    return FontWeight.w500;
  }

  static FontWeight get regular {
    return FontWeight.w400;
  }
}
