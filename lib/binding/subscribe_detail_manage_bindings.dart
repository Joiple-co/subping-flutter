import 'package:get/get.dart';
import 'package:subping/viewmodel/local/subsctibe_detail_manage/subscribe_detail_manage_viewmodel.dart';

class SubscribeDetailManageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SubscribeDetailManageViewModel());
  }
}
