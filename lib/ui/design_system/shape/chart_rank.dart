import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/main_tabs/home/header.dart';


class RankShape extends StatelessWidget {
  const RankShape() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 64.w,
            height: 90.w,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/rankColored.png"))),
            child: SubpingText(
              "1", 
              textAlign: TextAlign.center,
              color: SubpingColor.white100,
              fontWeight: SubpingFontWeight.bold, 
              size: SubpingFontSize.title4, ),
            );
  }
}