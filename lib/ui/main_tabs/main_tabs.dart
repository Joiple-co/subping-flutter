import 'package:subping/ui/main_tabs/bottom_nav_bar.dart';
import 'package:subping/ui/main_tabs/category/category.dart';
import 'package:subping/ui/main_tabs/my_page/my_page.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_manage.dart';

import '../../viewmodel/local/main_tabs/main_tabs_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home/home.dart';

class MainTabs extends StatelessWidget {
  const MainTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainTabsViewModel());

    List<Widget> pageList = [
      const Home(),
      const Category(),
      const SubscribeManage(),
      const MyPage()
    ];

    return GetBuilder<MainTabsViewModel>(
        builder: (controller) => Obx(() => Scaffold(
            body: IndexedStack(
              index: controller.tabIndex.value,
              children: pageList,
            ),
            bottomNavigationBar: BottomNavBar(controller))));
  }
}
