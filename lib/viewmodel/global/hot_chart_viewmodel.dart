import 'package:get/get.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/repository/service_repository.dart';

class HotChartViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();
  Rx<CurrentHotChartModel> charts = CurrentHotChartModel().obs;
  Rx<bool> _isLoading = false.obs;

  Future<void> updateCharts() async {
    try {
      charts.value = await _serviceRepository.getCurrentChart();
      _isLoading.value = false;
      return charts.value;
    } catch (e) {
      print(e);
    }
  }

  bool get isLoading {
    return _isLoading.value;
  }

  CurrentHotChartModel get chart {
    return charts.value;
  }

  @override
  void onInit() {
    super.onInit();
    _isLoading.value = true;
    updateCharts();
  }
}
