import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/repository/service_repository.dart';

class CategoryViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();
  ScrollController scrollViewController;
  TabController tabController;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxMap<String, List<ServiceModel>> services = <String, List<ServiceModel>>{}.obs;

  @override
  onInit() async {
    categories.value = await _serviceRepository.getCategories();
    categories.value.forEach((element) {
      services.value[element.category] = [];
    });

    super.onInit();
  }

  Future<void> getServices(CategoryModel categoryModel, {String repeatKey}) async {
    print("run ${categoryModel.category}");

    final nextServices = services.value;
    
    if(repeatKey == null) {
      nextServices[categoryModel.category] = (await _serviceRepository.getServices(categoryModel))[categoryModel.category];
    }

    else {

    }

    services.value = nextServices;
  }
}