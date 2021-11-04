import 'package:get/get.dart';
import 'package:subping/viewmodel/local/review_manage/my_review_history_viewmodel.dart';

class MyReviewHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MyReviewHistoryViewModel());
  }
}
