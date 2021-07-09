import 'package:get/get.dart';
import 'package:subping/repository/service_repository.dart';
import 'package:subping/model/current_hot_chart_model.dart';

class HomeViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();

  Rx<CurrentHotChartModel> charts = CurrentHotChartModel().obs;

  @override
  onInit() async {
    charts.value = await _serviceRepository.getCurrentChart();
    super.onInit();
  }
}
