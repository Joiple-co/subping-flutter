import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/settingTable.dart';

import 'main_tabs_viewmodel.dart';

class BottomNavBar extends StatelessWidget {
  final MainTabsViewModel controller;

  BottomNavBar(this.controller);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainTabsViewModel());

    TextStyle labelStyle = TextStyle(
        color: SubpingColor.black80,
        fontSize: SubpingFontSize.tiny1,
        fontWeight: SubpingFontWeight.regular);

    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.redAccent,
      onTap: (index) {
        controller.onChangeTabIndex(index);
      },
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: controller.tabIndex.value,
      unselectedLabelStyle: labelStyle,
      selectedLabelStyle: labelStyle,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.alarm), label: "홈"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.alarm), label: "카테고리"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.alarm), label: "구독관리"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.alarm), label: "마이페이지"),
      ],
    );
  }
}
