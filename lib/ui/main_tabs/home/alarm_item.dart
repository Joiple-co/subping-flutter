import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/helper/helper.dart';

class AlarmItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40.w, 0, 40.w, 0),
      padding: EdgeInsets.fromLTRB(
          0, SubpingSize.large40.h, 0, SubpingSize.large40.h),
      decoration: BoxDecoration(
        border: true
            ? Border(bottom: BorderSide(width: 2, color: SubpingColor.black30))
            : Border(bottom: BorderSide(width: 20, color: SubpingColor.back20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 3.h),
            width: 40.w,
            height: 40.h,
            child: Image.asset("assets/alarmIcon/delivery.png"),
          ),
          Space(size: SubpingSize.tiny10),
          Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SubpingText("넷플릭스",
                              size: SubpingFontSize.body3,
                              color: SubpingColor.black100),
                          Space(size: SubpingSize.tiny10),
                          SubpingText("결제 실패",
                              size: SubpingFontSize.body3,
                              color: SubpingColor.warning100),
                        ],
                      ),
                      SubpingText(Helper.refineDate("2021-07-26T14:58"),
                          size: SubpingFontSize.body3,
                          color: SubpingColor.black60)
                    ],
                  ),
                  Space(size: SubpingSize.tiny10),
                  SubpingText("2021년 7월 21일 넷플릭스에서 9,900원 결제가 완료되었습니다.",
                      color: SubpingColor.black80, size: SubpingFontSize.body4)
                ],
              ))
        ],
      ),
    );
  }
}
