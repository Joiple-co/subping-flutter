import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/viewmodel/local/main_tabs/main_tabs_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewModel.dart';

class MyPageServiceListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainTabsViewModel = Get.find<MainTabsViewModel>();
    final subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

    return Container(
      margin: EdgeInsets.fromLTRB(40.w, 30.h, 40.w, 30.h),
      color: SubpingColor.white100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubpingText(
            "상품 및 서비스",
            size: SubpingFontSize.body5,
            color: SubpingColor.black60,
          ),
          Space(size: SubpingSize.large20),
          GestureDetector(
            onTap: () {
              mainTabsViewModel.onChangeTabIndex(2);
              subscribeManageViewModel.changeTab(0);
            },
            child: SubpingText(
              "구독상품 관리",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large20),
          SubpingDivider(),
          Space(size: SubpingSize.large15),
          SubpingText(
            "사용자",
            size: SubpingFontSize.body5,
            color: SubpingColor.black60,
          ),
          Space(size: SubpingSize.large20),
          GestureDetector(
            onTap: () => Get.toNamed("/addressManagement"),
            child: SubpingText(
              "등록 주소 관리",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large20),
          GestureDetector(
            onTap: () => Get.toNamed("/cardManagement"),
            child: SubpingText(
              "등록 카드 관리",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large20),
          GestureDetector(
            child: SubpingText(
              "잠금 및 보안",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large15),
          SubpingDivider(),
          Space(size: SubpingSize.large15),
          SubpingText(
            "공지사항",
            size: SubpingFontSize.body5,
            color: SubpingColor.black60,
          ),
          Space(size: SubpingSize.large20),
          GestureDetector(
            child: SubpingText(
              "이용약관",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large20),
          GestureDetector(
            child: SubpingText(
              "개인정보처리방침",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large15),
          SubpingDivider(),
          Space(size: SubpingSize.large15),
          SubpingText(
            "고객센터",
            size: SubpingFontSize.body1,
            color: SubpingColor.black60,
          ),
          Space(size: SubpingSize.large20),
          GestureDetector(
            child: SubpingText(
              "앱 문의 및 건의",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
        ],
      ),
    );
  }
}
