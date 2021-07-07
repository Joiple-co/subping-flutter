import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubpingText(
            "당신을 위한 추천",
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.medium,
          ),
          Space(size: SubpingSize.medium20),
          GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: 500.h,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/appIntro1.png",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
