import 'package:flutter/material.dart';

import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SubpingColor.white100,
      elevation: 0,
      titleSpacing: 0.0,
      leading: IconButton(
        onPressed: Get.back,
        icon: Icon(
          Icons.chevron_left,
          size: 60.nsp,
          color: SubpingColor.black100,
        ),
      ),
      title: Container(
        padding: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 10.h),
        height: 73.h,
        width: 680.w,
        decoration: BoxDecoration(
            color: SubpingColor.back20,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: TextField(
          onChanged: (search) {},
          cursorColor: SubpingColor.subping100,
          cursorHeight: 40.h,
          style: TextStyle(color: Colors.red, fontSize: SubpingSize.medium20),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 18.h),
            hintText: "검색어를 입력해주세요",
            hintStyle: TextStyle(
                fontSize: SubpingFontSize.body1, color: SubpingColor.black60),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(100.h); // 다음에 쓰게 되면 혹시 아래 칸을 만들어야할지 몰라서 넣어둠

}
