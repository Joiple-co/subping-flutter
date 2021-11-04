import 'package:get/get.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';
import 'package:subping/viewmodel/global/product_viewmodel.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewmodel.dart';

class MainTabsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AlarmsViewModel());
    Get.put(UserViewModel());
    Get.put(ServiceViewModel());
    Get.put(ProductViewModel());
    Get.put(SubscribeViewModel());
    Get.put(SubscribeManageViewModel());
  }
}
