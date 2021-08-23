import 'package:get/get.dart';
import 'package:subping/viewmodel/local/write_review/write_review_viewmodel.dart';

class WriteReviewBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(WriteReviewViewModel());
  }
}
