import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/blank_page/alter_page.dart';
import 'package:subping/modules/design_system/loading/subping_loading,.dart';
import 'package:subping/modules/design_system/page/header_safe.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/alarm/alarm_item.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Alarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmViewModel = Get.find<AlarmsViewModel>();

    return Scaffold(
      backgroundColor: SubpingColor.white100,
      appBar: TitleAppBar(
        "알림",
        hasBackButton: true,
      ),
      body: HeaderSafe(
          child: RefreshIndicator(
              backgroundColor: SubpingColor.white100,
              onRefresh: () async {
                await alarmViewModel.updateAlarm();
              },
              child: Obx(
                () => alarmViewModel.isLoading
                    ? SubpingLoading()
                    : ListView(
                        shrinkWrap: isBlank ? true : false,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                            Container(
                                color: SubpingColor.back20,
                                width: double.infinity,
                                height: 20.h),
                            AlterPage(
                              blankType: BlankTypeStatus.alarm,
                              condition: isBlank,
                              child: Column(
                                children: alarmViewModel.alarms.contents
                                    .map((itemContent) {
                                  return AlarmItem(alarmContent: itemContent);
                                }).toList(),
                              ),
                            )
                          ]),
              ))),
    );
  }
}
