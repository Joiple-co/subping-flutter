import 'package:get/get.dart';
import 'package:subping/viewmodel/local/search/search.dart';

class SearchBinidings implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchViewModel());
  }
} 