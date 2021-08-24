import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/search/search_icon.dart';
import 'alarm_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolBar extends StatelessWidget {
  final bool hasSearchIcon;
  final bool hasAlarmIcon;

  ToolBar({
    this.hasSearchIcon = false,
    this.hasAlarmIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(13.w, 13.h, 13.w, 13.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: SubpingColor.white100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            hasSearchIcon
                ? Row(
                    children: [
                      SearchIcon(),
                      Space(
                        size: SubpingSize.large20,
                      ),
                    ],
                  )
                : Container(),
            hasAlarmIcon
                ? Row(
                    children: [
                      AlramIcon(),
                    ],
                  )
                : Container()
          ],
        ));
  }
}
