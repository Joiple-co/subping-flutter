import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubpingDivider extends StatelessWidget {

  final Color color;
  final double thickness;

  SubpingDivider({
      this.color = const Color.fromRGBO(246, 246, 247, 1),
      this.thickness = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: this.color,
      thickness: this.thickness.h 
    );
  }
}