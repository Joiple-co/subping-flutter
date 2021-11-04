import 'package:flutter/material.dart';
import 'package:subping/model/alarms/alarm_content_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/helper/helper.dart';

class AlarmItem extends StatelessWidget {
  final bool isLastItem;
  final AlarmContentsModel alarmContent;

  const AlarmItem({this.isLastItem = false, this.alarmContent, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          40.w, SubpingSize.large40.h, 40.w, SubpingSize.large40.h),
      decoration: BoxDecoration(
        color: alarmContent.read
            ? SubpingColor.subpingAlpha
            : SubpingColor.white100,
        border: !isLastItem
            ? Border(
                bottom: BorderSide(width: 1.h, color: SubpingColor.black30))
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 3.h),
            width: 40.w,
            height: 40.h,
            child: Image.asset("assets/alarmIcon/${alarmContent.type}.png"),
          ),
          Space(size: SubpingSize.tiny5),
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
                          SubpingText(alarmContent.title,
                              size: SubpingFontSize.body3,
                              color: SubpingColor.black100),
                          Space(size: SubpingSize.tiny5),
                          // SubpingText("결제 실패",
                          //     size: SubpingFontSize.body3,
                          //     color: SubpingColor.warning100),
                        ],
                      ),
                      SubpingText(Helper.refineDate(alarmContent.createdAt),
                          size: SubpingFontSize.body3,
                          color: SubpingColor.black60)
                    ],
                  ),
                  Space(size: SubpingSize.tiny5),
                  SubpingText(alarmContent.content,
                      color: SubpingColor.black80, size: SubpingFontSize.body4)
                ],
              ))
        ],
      ),
    );
  }
}
