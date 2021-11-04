import 'package:get/get.dart';
import 'package:subping/viewmodel/global/auth_viewmodel.dart';

class AppIntroBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthViewModel());
  }
}
