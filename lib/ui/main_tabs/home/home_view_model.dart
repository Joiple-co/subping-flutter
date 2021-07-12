import 'package:get/get.dart';
import 'package:subping/repository/service_repository.dart';
import 'package:subping/model/current_hot_chart_model.dart';

class HomeViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();
  final charts = Future.value(CurrentHotChartModel()).obs;

  Future<CurrentHotChartModel> getChartData() async {
    await Future.delayed(Duration(seconds: 2));
    return _serviceRepository.getCurrentChart();
  }

  void fetchList() async {
    charts.value = getChartData();
  }

  @override
  onInit() async {
    super.onInit();
    fetchList();
  }
}
