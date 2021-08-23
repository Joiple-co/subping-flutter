import 'package:get/get.dart';
import 'package:subping/viewmodel/local/onboarding/create_nickname_viewmodel.dart';

class CreateNickNameBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CreateNickNameViewModel());
  }
}
