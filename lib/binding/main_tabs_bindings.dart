import 'package:get/get.dart';
import 'package:subping/viewmodel/category_viewmodel.dart';
import 'package:subping/viewmodel/hot_chart_viewmodel.dart';

class MainTabsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HotChartViewModel());
    Get.put(CategoryViewModel());
  }
}