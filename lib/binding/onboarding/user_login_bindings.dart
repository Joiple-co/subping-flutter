import 'package:get/get.dart';
import 'package:subping/viewmodel/local/onboarding/user_login_viewmodel.dart';

class UserLoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserLoginViewModel());
  }
}
