import 'package:get/get.dart';
import 'package:subping/viewmodel/global/hot_chart_viewmodel.dart';

class HotChartBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HotChartViewModel());
  }
}
