import '../settingTable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart' as SubText;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubpingText extends StatelessWidget {
  final String text;
  final FontSize size;
  final SubpingFontWeight fontWeight;
  final SubpingColor color;

  static Map<SubpingColor, Color> colorSet = {
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

  static Map<FontSize, double> fontSizeSet = {
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

  static Map<SubpingFontWeight, FontWeight> fontWeightSet = {
    SubpingFontWeight.bold: FontWeight.bold,
    SubpingFontWeight.medium: FontWeight.w500,
    SubpingFontWeight.regular: FontWeight.w400
  };

  const SubpingText(
    @required this.text, {
    @required this.size,
    Key key,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Text(
      text,
      style: TextStyle(
          fontSize: fontSizeSet[this.size],
          color: colorSet[this.color],
          fontWeight: fontWeightSet[this.fontWeight]),
    ));
  }
}
