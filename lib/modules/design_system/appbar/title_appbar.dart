import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/home/tool_bar.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final String title;
  final Widget rear;
  final bool hasBackButton;
  final Size preferredSize;

  TitleAppBar(this.title, {this.hasBackButton = false, this.rear, Key key})
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
        rear != null ? rear : Container(),
      ]),
      leadingWidth: hasBackButton ? null : 0.w,
      elevation: 0,
    );
  }
}
