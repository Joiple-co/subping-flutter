import 'package:get/get.dart';
import 'package:subping/repository/service_repository.dart';
import 'package:subping/model/current_hot_chart_model.dart';

class HomeViewModel extends GetxController {
  final ServiceRepository _serviceRepository = ServiceRepository();
  Rx<CurrentHotChartModel> charts = CurrentHotChartModel().obs;

  Future<CurrentHotChartModel> getChartData() async {
    await Future.delayed(const Duration(seconds: 2));
    charts.value = await _serviceRepository.getCurrentChart();
    return charts.value;
  }

  @override
  onInit() async {
    super.onInit();
    getChartData();
  }
}
