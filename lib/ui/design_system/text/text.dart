import '../settingTable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart' as SubText;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubpingText extends StatelessWidget {
  final String text;
  final FontSize size;
  final SubpingFontWeight fontWeight;
  final SubpingColor color;

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
