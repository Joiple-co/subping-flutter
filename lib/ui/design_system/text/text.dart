import '../settingTable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart' as SubText;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubpingText extends StatelessWidget {
  final String text;
  final SubpingFontSize size;
  final SubpingFontWeight fontWeight;
  final SubpingColor color;
  final StrutStyle strutStyle;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final int maxLines;
  final double textScaleFactor;
  final String semanticsLabel;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior textHeightBehavior;

  const SubpingText(
    @required this.text, {
    @required this.size,
    Key key,
    this.color,
    this.fontWeight,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Text(text,
        style: TextStyle(
            fontSize: fontSizeSet[this.size],
            color: colorSet[this.color],
            fontWeight: fontWeightSet[this.fontWeight]),
        locale: this.locale,
        strutStyle: this.strutStyle,
        textAlign: this.textAlign,
        textWidthBasis: this.textWidthBasis,
        textHeightBehavior: this.textHeightBehavior,
        semanticsLabel: this.semanticsLabel,
        overflow: this.overflow,
        softWrap: this.softWrap,
        textDirection: this.textDirection,
        maxLines: this.maxLines,
        textScaleFactor: this.textScaleFactor));
  }
}
