import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatelessWidget {
  const MyPage() : super();

  Widget build(BuildContext context) {
    return HeaderSafe(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SubpingColor.white100,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            collapseMode: CollapseMode.pin,
          ),
          centerTitle: false,
          title: SubpingText("마이페이지",
              color: SubpingColor.black100,
              fontWeight: SubpingFontWeight.bold,
              size: SubpingFontSize.title5),
          leadingWidth: 0.w,
          elevation: 0,
        ),
        body: Container(),
      ),
    );
  }
}
