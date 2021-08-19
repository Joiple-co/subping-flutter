import 'package:get/get.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe/subscribe_manage_viewModel.dart';

class MainTabsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SubscribeManageViewModel());
    Get.put(AlarmsViewModel());
    Get.put(UserViewModel());
  }
}
