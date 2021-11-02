import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/setting_table.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../viewmodel/local/main_tabs/main_tabs_viewmodel.dart';

class BottomNavBar extends StatelessWidget {
  final MainTabsViewModel controller;

  BottomNavBar(this.controller);

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = TextStyle(
        color: SubpingColor.black80,
        fontSize: SubpingFontSize.tiny1,
        fontWeight: SubpingFontWeight.regular);

    TextStyle selectedLabelStyle = TextStyle(
        color: SubpingColor.black100,
        fontSize: SubpingFontSize.tiny1,
        fontWeight: SubpingFontWeight.regular);

    return BottomNavigationBar(
      onTap: (index) {
        controller.onChangeTabIndex(index);
      },
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: controller.tabIndex.value,
      unselectedLabelStyle: labelStyle,
      selectedLabelStyle: selectedLabelStyle,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        _generateTabIcon('assets/tabIcon/selectedHomeIcon.png',
            'assets/tabIcon/unselectedHomeIcon.png', '홈'),
        _generateTabIcon('assets/tabIcon/selectedCatagoryIcon.png',
            'assets/tabIcon/unselectedCatagoryIcon.png', '카테고리'),
        _generateTabIcon('assets/tabIcon/selectedSubIcon.png',
            'assets/tabIcon/unselectedSubIcon.png', '구독관리'),
        _generateTabIcon('assets/tabIcon/selectedMyPageIcon.png',
            'assets/tabIcon/unselectedMyPageIcon.png', '마이페이지'),
      ],
    );
  }
}

_generateTabIcon(String activeImgSrc, String imgSrc, String label) {
  return BottomNavigationBarItem(
    activeIcon: Image.asset(activeImgSrc, width: 40.w, height: 36.h),
    icon: Image.asset(imgSrc, width: 40.w, height: 36.h),
    label: label,
  );
}
