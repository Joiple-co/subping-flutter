import 'package:subping/ui/main_tabs/bottom_nav_bar.dart';
import 'package:subping/ui/main_tabs/my_page/my_page.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_manage.dart';

import '../../viewmodel/local/main_tabs/main_tabs_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home/home.dart';
import './category/category.dart';

class MainTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainTabsViewModel());

    List<Widget> pageList = [Home(), Category(), SubscribeManage(), MyPage()];

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
