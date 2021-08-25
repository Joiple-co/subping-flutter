import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';


class AlramIcon extends StatelessWidget {
  final int unreadAlarmCount;

  AlramIcon({this.unreadAlarmCount});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minHeight: 50.h,
            minWidth: 50.w,
          ),
          icon: Image.asset(
            "assets/icon/notificBell.png",
          ),
          onPressed: () {
            Get.toNamed("/alarm");
          },
        ),
        unreadAlarmCount != 0
            ? Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 10.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                      color: SubpingColor.warning100,
                      borderRadius: BorderRadius.circular(4)),
                ),
              )
            : Space(size: SubpingSize.large20)
      ],
    );
  }
}
