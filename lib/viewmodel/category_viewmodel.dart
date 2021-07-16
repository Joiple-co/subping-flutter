import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/repository/service_repository.dart';

class CategoryViewModel extends GetxController {
  ServiceRepository _serviceRepository = ServiceRepository();

  RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  
  @override
  onInit() async {
    _categories.value = await _serviceRepository.getCategories();

    super.onInit();
  }

  List<CategoryModel> get categories {
    return _categories.value;
  }
}