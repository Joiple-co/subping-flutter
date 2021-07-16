import 'package:get/get.dart';
import 'package:subping/viewmodel/hot_chart_viewmodel.dart';

class HotChartBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HotChartViewModel());
  }
}