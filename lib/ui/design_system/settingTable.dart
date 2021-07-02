import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

enum Size {
  large64,
  large50,
  large48,
  large40,
  large30,
  medium24,
  medium20,
  medium16,
  tiny14,
  tiny12,
  tiny10,
}

enum SubpingColor {
  subping100,
  subping50,
  subping30,
  warning100,
  black100,
  black80,
  black60,
  back20,
  white100,
}

enum FontSize {
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

enum SubpingFontWeight { bold, medium, regular }

Map<SubpingColor, Color> colorSet = {
  SubpingColor.subping100: Color.fromRGBO(80, 110, 225, 1),
  SubpingColor.subping50: Color.fromRGBO(80, 140, 255, 1),
  SubpingColor.subping30: Color.fromRGBO(180, 209, 255, 1),
  SubpingColor.warning100: Color.fromRGBO(250, 60, 90, 1),
  SubpingColor.black100: Color.fromRGBO(20, 20, 20, 1),
  SubpingColor.black60: Color.fromRGBO(170, 176, 195, 1),
  SubpingColor.black80: Color.fromRGBO(85, 85, 95, 1),
  SubpingColor.back20: Color.fromRGBO(246, 246, 247, 1),
  SubpingColor.white100: Color.fromRGBO(0, 0, 0, 1)
};

Map<FontSize, double> fontSizeSet = {
  FontSize.title1: 62.nsp,
  FontSize.title2: 60.nsp,
  FontSize.title3: 52.nsp,
  FontSize.title4: 46.nsp,
  FontSize.title5: 42.nsp,
  FontSize.title6: 36.nsp,
  FontSize.body1: 32.nsp,
  FontSize.body2: 30.nsp,
  FontSize.body3: 28.nsp,
  FontSize.body4: 26.nsp,
  FontSize.body5: 24.nsp,
  FontSize.tiny1: 22.nsp,
};

Map<SubpingFontWeight, FontWeight> fontWeightSet = {
  SubpingFontWeight.bold: FontWeight.bold,
  SubpingFontWeight.medium: FontWeight.w500,
  SubpingFontWeight.regular: FontWeight.w400
};