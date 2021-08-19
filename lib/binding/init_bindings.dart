import 'package:get/get.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ServiceViewModel());
  }
}
