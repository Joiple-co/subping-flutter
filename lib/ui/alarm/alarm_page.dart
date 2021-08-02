import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/page/header_safe.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/alarm/alarm_item.dart';

class AlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        "알림",
        hasBackButton: true,
      ),
      body: HeaderSafe(
          child: RefreshIndicator(
        backgroundColor: SubpingColor.white100,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
          print(3);
        },
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Container(
              width: double.infinity,
              height: 20.h,
              color: SubpingColor.back20,
            ),
            AlarmItem(),
            AlarmItem(),
            AlarmItem(),
            AlarmItem(),
            AlarmItem(),
            AlarmItem(),
            AlarmItem(),
            AlarmItem(),
            AlarmItem(
              isLastItem: true,
            ),
          ],
        ),
      )),
    );
  }
}
