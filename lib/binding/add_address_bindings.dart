import 'package:get/get.dart';
import 'package:subping/viewmodel/local/main_tabs/my_page/address_viewModel.dart';

class AddAddressBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddAddressViewModel());
  }
}
