import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/subping_ui.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final String title;
  final bool hasBackButton;
  final bool hasToolBar;
  final Size preferredSize;

  TitleAppBar(this.title,
      {this.hasBackButton = false, Key key, this.hasToolBar = false})
      : preferredSize = Size.fromHeight(100.0.h),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SubpingColor.white100,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.pin,
      ),
      centerTitle: false,
      leading: hasBackButton
          ? IconButton(
              onPressed: Get.back,
              icon: Icon(
                Icons.chevron_left,
                size: 60.nsp,
                color: SubpingColor.black100,
              ))
          : null,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SubpingText(title,
            color: SubpingColor.black100,
            fontWeight: SubpingFontWeight.bold,
            size: SubpingFontSize.title5),
        this.hasToolBar ? ToolBar() : ""
      ]),
      leadingWidth: hasBackButton ? null : 0.w,
      elevation: 0,
    );
  }
}
