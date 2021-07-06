import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RankShape extends StatelessWidget {
  final int rank;

  const RankShape(this.rank) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 64.w,
            height: 90.w,
            decoration: BoxDecoration(
              image: rank <= 3 ?
                DecorationImage(image: AssetImage("assets/rankColored.png")) :
                DecorationImage(image: AssetImage("assets/rankUnColored.png"))),
            child: SubpingText(
              this.rank.toString(), 
              textAlign: TextAlign.center,
              color: SubpingColor.white100,
              fontWeight: SubpingFontWeight.bold, 
              size: SubpingFontSize.title4, ),
            );
  }
}