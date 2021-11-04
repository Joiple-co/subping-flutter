import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/model/review_model.dart';
import 'package:subping/repository/review_repository.dart';

class MyReviewHistoryViewModel extends GetxController {
  ReviewRepository repository = ReviewRepository();
  RxList<ReviewModel> reviewList = <ReviewModel>[].obs;

  Future<void> getMyReviewHistory() async {
    reviewList.value = await repository.getReviews();
    print(reviewList.value);
  }

  Future<void> updateReviewHistory() {}
  @override
  void onInit() {
    super.onInit();
  }
}
