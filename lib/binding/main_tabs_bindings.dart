import 'package:get/get.dart';
import 'package:subping/viewmodel/global/category_viewmodel.dart';
import 'package:subping/viewmodel/global/hot_chart_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/home/home_view_model.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe/subscribe_manage_viewModel.dart';

class MainTabsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HotChartViewModel());
    Get.put(CategoryViewModel());
    Get.put(SubscribeManageViewModel());
    // Get.put(HomeViewModel());
  }
}
