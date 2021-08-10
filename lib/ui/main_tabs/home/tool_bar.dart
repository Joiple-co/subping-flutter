import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/repository/alarm_repository.dart';

import 'alarm_icon.dart';

class ToolBar extends StatelessWidget {
  final int unreadAlarmCount;

  ToolBar({this.unreadAlarmCount = 0});

  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minHeight: 50.h,
            minWidth: 50.w,
          ),
          icon: Image.asset(
            "assets/icon/search.png",
          ),
          onPressed: () {},
        ),
        Space(
          size: SubpingSize.large40,
        ),
        AlramIcon(unreadAlarmCount: unreadAlarmCount),
      ],
    ));
  }
}
