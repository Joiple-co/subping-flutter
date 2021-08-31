import 'package:get/get.dart';
import 'package:subping/viewmodel/local/add_address/add_address_viewmodel.dart';

class AddAddressBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddAddressViewModel());
  }
}
