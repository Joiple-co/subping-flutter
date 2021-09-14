import 'package:get/get.dart';
import 'package:subping/viewmodel/local/add_card/add_card_viewmodel.dart';

class AddCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddCardViewModel());
  }
}
