import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/repository/service_repository.dart';

class ServiceViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();
  RxList<ServiceModel> _services = <ServiceModel>[].obs;


  Future<void> updateServices(CategoryModel categoryModel, {String repeatKey}) async {
    if(repeatKey == null && _services.length == 0) {
      print("rin");
      _services.value = (await _serviceRepository.getServices(categoryModel))[categoryModel.category];
    }

    else {

    }
  }

  List<ServiceModel> get services {
    return _services.value;
  }
}