import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

class UserInfoContainer extends StatelessWidget {

  final UserViewModel userData;

  UserInfoContainer({
    this.userData
  });

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      GestureDetector(
        child: CircleAvatar(
          radius: 40.w,
          backgroundImage: Image.network(
            "https://i.pinimg.com/474x/e6/c6/2b/e6c62bcd002903348d117782fea403ab.jpg",
            width: 81.w,
            height: 81.h,
          ).image,
        ),
      ),
      Space(
        size: SubpingSize.medium20,
      ),
      Obx(()=>
            Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubpingText("${userData.name}님",
              fontWeight: FontWeight.bold, size: SubpingFontSize.body2),
          SubpingText(
            "${userData.email}",
            color: SubpingColor.black60,
            size: SubpingFontSize.tiny1,
          )
        ],
      ),
      ),
      Expanded(
        child: Container(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/icon/black_middleRightArrow.png',
            height: 40.h,
            width: 40.w,
          ),
        ),
      )
    ]);
  }
}
