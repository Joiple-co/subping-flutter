import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SubpingTextSpan extends TextSpan {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const SubpingTextSpan(
      {text, children, this.color, this.fontWeight, this.fontSize})
      : super(children: children, text: text);

  @override
  void build(ParagraphBuilder builder,
      {double textScaleFactor = 1.0, List<PlaceholderDimensions> dimensions}) {
    final TextStyle style =
        TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
    final bool hasStyle = style != null;
    if (hasStyle) {
      builder.pushStyle(style.getTextStyle(textScaleFactor: textScaleFactor));
    }
    if (text != null) builder.addText(text);
    if (children != null) {
      for (final InlineSpan child in children) {
        assert(child != null);
        child.build(
          builder,
          textScaleFactor: textScaleFactor,
          dimensions: dimensions,
        );
      }
    }
    if (hasStyle) builder.pop();
  }
}
