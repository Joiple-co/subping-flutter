import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import './home/home.dart';
import './category/category.dart';

class MainTabsController extends GetxController {
  RxInt tabIndex = 0.obs;

  void onChangeTabIndex(int index) {
    tabIndex(index);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
