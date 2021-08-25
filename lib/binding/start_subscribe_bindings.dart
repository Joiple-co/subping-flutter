import 'package:get/get.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class StartSubscribeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(StartSubscribeViewModel());
  }
}
