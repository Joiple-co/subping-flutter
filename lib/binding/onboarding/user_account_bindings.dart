import 'package:get/get.dart';
import 'package:subping/viewmodel/local/onboarding/user_account_viewmodel.dart';

class UserAccuntBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserAccountViewModel());
  }
}
