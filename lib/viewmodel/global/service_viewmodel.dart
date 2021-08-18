import 'package:get/get.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/repository/service_repository.dart';

class ServiceViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();
  RxMap<String, ServiceModel> _services = <String, ServiceModel>{}.obs;
  RxMap<String, List<ServiceModel>> _categoryServices = <String, List<ServiceModel>>{}.obs;
  RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  Rx<CurrentHotChartModel> _chart = CurrentHotChartModel().obs;
  RxBool _chartLoading = false.obs;

  Future<void> updateCharts() async {
    try {
      _chartLoading.value = true;
      
      final response = await _serviceRepository.getCurrentChart();
      _chart.value = response;

      response.serviceRank.forEach((item) {
        _services.value[item.id] = item;
      });

      _chartLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCategory() async {
    final response = await _serviceRepository.getCategories();

    _categories.value = response;

    response.forEach((item) {
      updateCategoryServices(item);
    });
  }

  Future<void> updateCategoryServices(CategoryModel categoryModel, {String repeatKey}) async {
    if(repeatKey == null && (_categoryServices.value[categoryModel.name] ?? []).length == 0) {
      final response = (await _serviceRepository.getServicesByCategory(categoryModel));
      print(response);
      _categoryServices.value[categoryModel.name] = response;
    }

    else {

    }
  }
  
  ServiceModel getService(String serviceId) {
    if(_services.value[serviceId] != null) {
      return _services.value[serviceId];
    }

    else {
      _services.value[serviceId] = ServiceModel();
      return _services.value[serviceId];
    }
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
