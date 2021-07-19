import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ToolBar extends StatelessWidget {
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
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minHeight: 50.h,
            minWidth: 50.w,
          ),
          icon: Image.asset(
            "assets/icon/notificBell.png",
          ),
          onPressed: () {},
        )
      ],
    ));
  }
}
