import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MainTabsViewModel extends GetxController {
  RxInt tabIndex = 0.obs;

  void onChangeTabIndex(int index) {
    print(index);
    tabIndex(index);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
