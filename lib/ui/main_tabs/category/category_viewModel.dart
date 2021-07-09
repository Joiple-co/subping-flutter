import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/repository/service_repository.dart';

class CategoryViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();
  ScrollController scrollViewController;
  TabController tabController;

  RxMap<String, List<ServiceModel>> services = <String, List<ServiceModel>>{}.obs;

  @override
  onInit() async {
    services.value = await _serviceRepository.getServices();
    super.onInit();
  }

}