import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/design_system/tool_bar/search_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/tool_bar/alarm_icon.dart';

class ToolBar extends StatelessWidget {
  final bool hasSearchIcon;
  final bool hasAlarmIcon;
  final int unreadAlarmCount;

  const ToolBar(
      {this.hasSearchIcon = false,
      this.hasAlarmIcon = false,
      this.unreadAlarmCount = 0,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(13.w, 13.h, 13.w, 13.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: SubpingColor.white100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            hasSearchIcon
                ? Row(
                    children: [
                      const SearchIcon(),
                      Space(
                        size: SubpingSize.large20,
                      ),
                    ],
                  )
                : Container(),
            hasAlarmIcon
                ? Row(
                    children: [
                      AlramIcon(
                        unreadAlarmCount: unreadAlarmCount,
                      ),
                    ],
                  )
                : Container()
          ],
        ));
  }
}
