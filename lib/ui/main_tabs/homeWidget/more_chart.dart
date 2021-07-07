import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/settingTable.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(SubpingSize.medium24.w,
            SubpingSize.tiny14.h, SubpingSize.medium24.w, SubpingSize.tiny14.h),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: SubpingColor.black60),
            borderRadius: BorderRadius.circular(8)),
        child: SubpingText(
          '+ 인기 상품 더보기',
          color: SubpingColor.black60,
          size: SubpingFontSize.body4,
          fontWeight: SubpingFontWeight.bold,
        ),
      ),
    );
  }
}
