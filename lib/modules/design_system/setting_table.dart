import 'package:flutter/material.dart';

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

extension SubpingSize on SubpingSizeExtension {
  static double get large80 {
    return 80.0;
  }

  static double get large70 {
    return 70.0;
  }

  static double get large64 {
    return 64.0;
  }

  static double get large56 {
    return 56.0;
  }

  static double get large50 {
    return 50.0;
  }

  static double get large48 {
    return 48.0;
  }

  static double get large40 {
    return 40.0;
  }

  static double get large30 {
    return 30.0;
  }

  static double get medium28 {
    return 30.0;
  }

  static double get medium24 {
    return 24.0;
  }

  static double get medium22 {
    return 22.0;
  }

  static double get medium20 {
    return 20.0;
  }

  static double get medium16 {
    return 16.0;
  }

  static double get tiny14 {
    return 14.0;
  }

  static double get tiny12 {
    return 12.0;
  }

  static double get tiny10 {
    return 10.0;
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
    return Color.fromRGBO(80, 110, 225, 1);
  }

  static Color get subping50 {
    return Color.fromRGBO(80, 140, 255, 1);
  }

  static Color get subping30 {
    return Color.fromRGBO(180, 209, 255, 1);
  }

  static Color get warning100 {
    return Color.fromRGBO(250, 60, 90, 1);
  }

  static Color get black100 {
    return Color.fromRGBO(20, 20, 20, 1);
  }

  static Color get black80 {
    return Color.fromRGBO(85, 85, 95, 1);
  }

  static Color get black60 {
    return Color.fromRGBO(170, 176, 195, 1);
  }

  static Color get black30 {
    return Color.fromRGBO(233, 233, 238, 1);
  }

  static Color get back20 {
    return Color.fromRGBO(246, 246, 247, 1);
  }

  static Color get white100 {
    return Color.fromRGBO(255, 255, 255, 1);
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
