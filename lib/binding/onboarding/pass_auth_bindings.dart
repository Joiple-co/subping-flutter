import 'package:get/get.dart';
import 'package:subping/viewmodel/local/onboarding/pass_auth_viewmodel.dart';

class PassAuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PassAuthViewModel());
  }
}
