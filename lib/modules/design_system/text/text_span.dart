import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../settingTable.dart';

class SubpingTextSpan extends TextSpan {
  final List<SubpingTextSpan> children;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  SubpingTextSpan(
      {this.text, this.children, this.color, this.fontWeight, this.fontSize});

  @override
  void build(ParagraphBuilder builder,
      {double textScaleFactor = 1.0, List<PlaceholderDimensions> dimensions}) {
    final TextStyle style = TextStyle(
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: this.color);
    final bool hasStyle = style != null;
    if (hasStyle)
      builder.pushStyle(style.getTextStyle(textScaleFactor: textScaleFactor));
    if (this.text != null) builder.addText(this.text);
    if (this.children != null) {
      for (final InlineSpan child in this.children) {
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
