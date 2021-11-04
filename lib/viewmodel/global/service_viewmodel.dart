import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:subping/hive/recent_service.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/repository/service_repository.dart';

class ServiceViewModel extends GetxController {
  final ServiceRepository _serviceRepository = ServiceRepository();
  final Map<String, Rx<ServiceModel>> _services =
      <String, Rx<ServiceModel>>{}.obs;
  final RxMap<String, List<ServiceModel>> _categoryServices =
      <String, List<ServiceModel>>{}.obs;
  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  final Rx<CurrentHotChartModel> _chart = CurrentHotChartModel().obs;
  final RxBool _chartLoading = false.obs;
  final RxList<RecentService> _recentService = <RecentService>[].obs;
  final RxSet<String> _likes = <String>{}.obs;
  Map<String, Function> _likesReserved = {};

  Future<void> updateCharts() async {
    try {
      _chartLoading.value = true;

      final response = await _serviceRepository.getCurrentChart();
      _chart.value = response;

      for (var item in response.serviceRank) {
        _services[item.id] = item.obs;
        _services[item.id].refresh();
      }

      _chartLoading.value = false;

      _chart.refresh();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateCategory({bool updateServices = false}) async {
    final response = await _serviceRepository.getCategories();

    _categories.value = response;
    _categories.refresh();

    if (updateServices) {
      for (var item in response) {
        updateCategoryServices(item);
      }
    }
  }

  Future<void> updateCategoryServices(CategoryModel categoryModel,
      {String repeatKey}) async {
    if (repeatKey == null) {
      final response =
          (await _serviceRepository.getServicesByCategory(categoryModel));
      _categoryServices[categoryModel.name] = response;

      for (var item in response) {
        if (_services[item.id] != null) {
          _services[item.id].value.updateServiceModel(item);
        } else {
          _services[item.id] = item.obs;
        }

        _services[item.id].refresh();
      }

      _categoryServices.refresh();
    } else {}
  }

  Future<void> updateLikeServices() async {
    final services = await _serviceRepository.getLikeServices();

    // ignore: invalid_use_of_protected_member
    _likes.value = {};

    for (var item in services) {
      if (_services[item.id] != null) {
        _services[item.id].value.updateServiceModel(item);
      } else {
        _services[item.id] = item.obs;
      }

      _likes.add(item.id);
      _services[item.id].refresh();
    }

    _likes.refresh();
  }

  Future<void> updateService(String serviceId, {bool page = false}) async {
    final service = await _serviceRepository.getService(serviceId);

    if (_services[service.id] != null) {
      _services[service.id].value.updateServiceModel(service);
    } else {
      _services[service.id] = service.obs;
    }

    _services[service.id].refresh();

    if (page) {
      putRecentService(service);
    }
  }

  ServiceModel getService(String serviceId) {
    if (_services[serviceId] != null) {
      return _services[serviceId].value;
    } else {
      _services[serviceId].value = ServiceModel();
      return _services[serviceId].value;
    }
  }

  Future<void> toggleUserLike(String serviceId) async {
    // 해당 서비스의 유저 라이크가 존재하면 다음 토글은 on 존재하지 않으면 off
    if (_services[serviceId] == null ||
        _services[serviceId].value.like == null) {
      return;
    }

    final toggle = !_services[serviceId].value.like;

    _services[serviceId].value.like = toggle;

    _services[serviceId].refresh();
    _likes.refresh();

    _likesReserved[serviceId] = () async {
      final response =
          await _serviceRepository.toggleUserLike(serviceId, toggle);

      if (response != null) {
        _services[serviceId].value.like = response;
      }

      _services[serviceId].refresh();
    };
  }

  Future<void> synchronizeLike() async {
    List<Future> requests = [];

    if (_likesReserved.isNotEmpty) {
      _likesReserved.forEach((key, value) {
        requests.add(value());
      });

      await Future.wait(requests);

      _likesReserved = {};
      updateLikeServices();
    }
  }

  List<RecentService> sortRecentServices(List<RecentService> recentServices) {
    recentServices.sort((a, b) {
      return -a.createdAt.millisecondsSinceEpoch
          .compareTo(b.createdAt.millisecondsSinceEpoch);
    });

    return recentServices;
  }

  Future<void> putRecentService(ServiceModel service) async {
    final box = Hive.box<RecentService>("recentView");
    final now = DateTime.now();

    await box.put(
        service.id,
        RecentService(service.id, service.name, service.summary,
            service.serviceLogoUrl, service.tag, now));

    final sortedRecentServices =
        sortRecentServices(box.valuesBetween().toList());

    if (sortedRecentServices.length > 20) {
      for (int index = 20; index < sortedRecentServices.length; index++) {
        await box.delete(sortedRecentServices[index].serviceId);
      }
    }
  }

  Future<void> updateRecentServices() async {
    final box = Hive.box<RecentService>("recentView");

    final sortedRecentServices =
        sortRecentServices(box.valuesBetween().toList());

    _recentService.value = sortedRecentServices;
  }

  List<ServiceModel> getServicesWithCategory(CategoryModel category) {
    return _categoryServices[category.name];
  }

  bool get chartLoading {
    return _chartLoading.value;
  }

  CurrentHotChartModel get chart {
    return _chart.value;
  }

  Map<String, Rx<ServiceModel>> get services {
    return _services;
  }

  Map<String, List<ServiceModel>> get categoryServices {
    return _categoryServices;
  }

  List<CategoryModel> get categories {
    return _categories;
  }

  Set<String> get likes {
    return _likes;
  }

  List<RecentService> get recentService {
    return _recentService;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
