import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankShape extends StatelessWidget {
  final int rank;

  const RankShape(this.rank, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 90.w,
      decoration: BoxDecoration(
          image: rank <= 3
              ? const DecorationImage(
                  image: AssetImage("assets/rankColored.png"))
              : const DecorationImage(
                  image: AssetImage("assets/rankUnColored.png"))),
      child: SubpingText(
        rank.toString(),
        textAlign: TextAlign.center,
        color: SubpingColor.white100,
        fontWeight: SubpingFontWeight.bold,
        size: SubpingFontSize.title4,
      ),
    );
  }
}
