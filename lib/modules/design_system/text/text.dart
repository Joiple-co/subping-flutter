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
            fontSize: this.size,
            color: this.color,
            fontWeight: this.fontWeight),
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
