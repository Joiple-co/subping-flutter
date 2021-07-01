import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart' as SubText;

class Text extends StatelessWidget {
  final String text;
  final String size;
  final String fontWeight;
  final TextStyle textStyle;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final Locale locale;
  final StrutStyle strutStyle;
  final String semanticsLabel;
  final int maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextHeightBehavior textHeightBehavior;
  final TextWidthBasis textWidthBasis;
  final double textScaleFactor;

  const Text(@required this.text,
      {@required this.size,
      Key key,
      this.fontWeight,
      this.textStyle,
      this.textDirection,
      this.strutStyle,
      this.textAlign,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (SubText.Text(
      text,
      style: textStyle,
    ));
  }
}
