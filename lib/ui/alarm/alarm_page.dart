import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/loading/subping_loading,.dart';
import 'package:subping/modules/design_system/page/header_safe.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/alarm/alarm_item.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';

class AlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmViewModel = Get.find<AlarmsViewModel>();
    alarmViewModel.readAlarm();

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
                () => alarmViewModel.alarmIsLoading
                    ? SubpingLoading()
                    : ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: alarmViewModel.alarms.value.contents
                            .map((itemContent) {
                          return AlarmItem(alarmContent: itemContent);
                        }).toList(),
                      ),
              ))),
    );
  }
}
