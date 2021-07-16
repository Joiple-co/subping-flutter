import 'package:get/get.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/repository/service_repository.dart';

class HotChartViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();
  Rx<CurrentHotChartModel> charts = CurrentHotChartModel().obs;

  @override
  void onClose() {
    print("close");
  }

  Future<void> updateCharts() async {
    charts.value = await _serviceRepository.getCurrentChart();
    return charts.value;
  }

  CurrentHotChartModel get chart {
    return charts.value;
  }
}


