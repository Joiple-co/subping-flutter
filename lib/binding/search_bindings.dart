import 'package:get/get.dart';
import 'package:subping/viewmodel/local/search/search_viewmodel.dart';

class SearchBinidings implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchViewModel());
  }
} 