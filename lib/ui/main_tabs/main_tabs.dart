import 'package:subping/ui/design_system/settingTable.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/bottom_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_tabs_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home/home.dart';
import './category/category.dart';

class MainTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainTabsViewModel());

    List<Widget> pageList = [Home(), Category(), Home(), Category()];

    return GetBuilder<MainTabsViewModel>(
        builder: (controller) => Obx(() => Scaffold(
            body: Container(
              child: IndexedStack(
                index: controller.tabIndex.value,
                children: pageList,
              ),
            ),
            bottomNavigationBar: Container(
              child: BottomNavBar(controller),
            ))));
  }
}
