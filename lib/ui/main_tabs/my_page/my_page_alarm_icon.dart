import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';

class MyPageAlramIcon extends StatelessWidget {
  final alarmViewModel = Get.find<AlarmsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: SubpingColor.white100,
          boxShadow: [
            BoxShadow(
                color: SubpingColor.black30,
                offset: Offset(0.w, 0.h),
                blurRadius: 8)
          ]),
      child: Stack(
        children: [
          IconButton(
            padding: EdgeInsets.all(8.0),
            constraints: BoxConstraints(
              minHeight: 50.h,
              minWidth: 50.w,
            ),
            icon: Image.asset(
              "assets/icon/notificBell.png",
            ),
            onPressed: () {
              Get.toNamed("/alarmPage");
            },
          ),
          alarmViewModel.alarms.value?.unreadAlarms != 0
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
              : Space(size: SubpingSize.large40)
        ],
      ),
    );
  }
}
