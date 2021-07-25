import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class TimeDisplay extends StatelessWidget {
  final String time;

  const TimeDisplay(this.time) : super();

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 8.h, 15.w, 8.h),
      decoration: BoxDecoration(
        color: SubpingColor.back20,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 27.w,
            height: 27.h,
            child: Image.asset(
              "assets/icon/clock.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.w, 0, 0, 5.h),
            child: SubpingText(time,
                fontWeight: SubpingFontWeight.medium,
                size: SubpingFontSize.body3,
                color: SubpingColor.subping50),
          )
        ],
      ),
    );
  }
}
