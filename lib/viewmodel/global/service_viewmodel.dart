import 'dart:async';

import 'package:get/get.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/repository/service_repository.dart';

class ServiceViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();
  RxMap<String, ServiceModel> _services = <String, ServiceModel>{}.obs;
  RxMap<String, List<ServiceModel>> _categoryServices =
      <String, List<ServiceModel>>{}.obs;
  RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  Rx<CurrentHotChartModel> _chart = CurrentHotChartModel().obs;
  RxBool _chartLoading = false.obs;

  StreamSubscription _toggleSubscription;

  Future<void> updateCharts() async {
    try {
      _chartLoading.value = true;

      final response = await _serviceRepository.getCurrentChart();
      _chart.value = response;

      response.serviceRank.forEach((item) {
        _services.value[item.id] = item;
      });

      _chartLoading.value = false;

      _services.refresh();
      _chart.refresh();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCategory() async {
    final response = await _serviceRepository.getCategories();

    _categories.value = response;
    _categories.refresh();

    response.forEach((item) {
      updateCategoryServices(item);
    });
  }

  Future<void> updateCategoryServices(CategoryModel categoryModel,
      {String repeatKey}) async {
    if (repeatKey == null &&
        (_categoryServices.value[categoryModel.name] ?? []).length == 0) {
      final response =
          (await _serviceRepository.getServicesByCategory(categoryModel));
      _categoryServices.value[categoryModel.name] = response;

      _categoryServices.refresh();
    } else {}
  }

  Future<void> updateService(String serviceId) async {
    final service = await _serviceRepository.getService(serviceId);

    _services.value[service.id].updateServiceModel(service);
    _services.refresh();
  }

  ServiceModel getService(String serviceId) {
    if (_services.value[serviceId] != null) {
      return _services.value[serviceId];
    } else {
      _services.value[serviceId] = ServiceModel();
      return _services.value[serviceId];
    }
  }

  Future<void> toggleUserLike(String serviceId) async {
    // 해당 서비스의 유저 라이크가 존재하면 다음 토글은 on 존재하지 않으면 off
    if (_services[serviceId] == null || _services[serviceId].like == null) {
      return;
    }

    final toggle = !_services[serviceId].like;

    if (_toggleSubscription != null) {
      _toggleSubscription.cancel();
    }

    if (!toggle) {
      _services[serviceId].like = false;
    } else {
      _services[serviceId].like = true;
    }

    _services.refresh();

    _toggleSubscription = new Future.delayed(const Duration(seconds: 1))
        .asStream()
        .listen((event) async {
      final response =
          await _serviceRepository.toggleUserLike(serviceId, toggle);

      if (response != null) {
        _services[serviceId].like = response;
      }

      _services.refresh();
    });
  }

  List<ServiceModel> getServicesWithCategory(CategoryModel category) {
    return _categoryServices.value[category.name];
  }

  bool get chartLoading {
    return _chartLoading.value;
  }

  CurrentHotChartModel get chart {
    return _chart.value;
  }

  Map<String, ServiceModel> get services {
    return _services.value;
  }

  Map<String, List<ServiceModel>> get categoryServices {
    return _categoryServices.value;
  }

  List<CategoryModel> get categories {
    return _categories.value;
  }

  @override
  void onInit() {
    super.onInit();
    updateCharts();
    updateCategory();
  }
}
