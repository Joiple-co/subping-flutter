import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset(
            "assets/icon/search.png",
            height: 50.nsp,
            width: 50.nsp,
          ),
          onPressed: () {},
        ),
        Space(size: SubpingSize.large40),
        IconButton(
          icon: Image.asset(
            "assets/icon/notificBell.png",
            height: 60.nsp,
            width: 60.nsp,
          ),
          onPressed: () {},
        )
      ],
    ));
  }
}
