import 'package:get/get.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';
import 'package:subping/viewmodel/global/hot_chart_viewmodel.dart';

class AlarmsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AlarmsViewModel());
  }
}
