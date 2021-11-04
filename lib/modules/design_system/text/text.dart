import 'package:flutter/material.dart';

class SubpingText extends StatelessWidget {
  final double height;
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
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
    this.height,
    this.fontWeight = FontWeight.w500,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor = 1.0,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Text(text,
        style: TextStyle(
            height: height,
            fontSize: size,
            color: color,
            fontWeight: fontWeight),
        locale: locale,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        semanticsLabel: semanticsLabel,
        overflow: overflow,
        softWrap: softWrap,
        textDirection: textDirection,
        maxLines: maxLines,
        textScaleFactor: textScaleFactor));
  }
}
