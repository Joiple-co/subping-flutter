import 'package:get/get.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';

class AlarmsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AlarmsViewModel());
  }
}
