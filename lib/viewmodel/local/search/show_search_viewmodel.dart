import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ShowSearchViewModel extends GetxController {
  RxList<String> categories = ["상품", "스토어", "리뷰"].obs;

  TabController tabController;
  ScrollController scrollViewController;
  ItemScrollController itemScrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
}
