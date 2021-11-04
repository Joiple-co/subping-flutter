import 'package:flutter/material.dart';

class SubpingDivider extends StatelessWidget {
  final Color color;
  final double thickness;

  const SubpingDivider(
      {this.color = const Color.fromRGBO(246, 246, 247, 1),
      this.thickness = 1,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(color: color, thickness: thickness);
  }
}
