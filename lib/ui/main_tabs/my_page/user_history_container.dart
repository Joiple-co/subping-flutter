import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHistoryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed("/likeService");
          },
          child: Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minHeight: 50.h,
                  minWidth: 50.w,
                ),
                icon: Image.asset(
                  "assets/icon/mypage1.png",
                ),
              ),
              SubpingText("찜한 상품")
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed("/myReviewHistory"),
          child: Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minHeight: 50.h,
                  minWidth: 50.w,
                ),
                icon: Image.asset(
                  "assets/icon/mypage2.png",
                ),
                onPressed: () {},
              ),
              SubpingText("나의 리뷰")
            ],
          ),
        ),
        GestureDetector(
          child: Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minHeight: 50.h,
                  minWidth: 50.w,
                ),
                icon: Image.asset(
                  "assets/icon/mypage3.png",
                ),
                onPressed: () {},
              ),
              SubpingText("최근 본 상품")
            ],
          ),
        )
      ],
    );
  }
}
