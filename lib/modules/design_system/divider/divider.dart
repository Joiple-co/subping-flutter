import 'package:flutter/material.dart';

class SubpingDivider extends StatelessWidget {

  final Color color;
  final double thickness;

  SubpingDivider({
      this.color = const Color.fromRGBO(246, 246, 247, 1),
      this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: this.color,
      thickness: this.thickness
    );
  }
}