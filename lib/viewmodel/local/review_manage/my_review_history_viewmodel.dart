import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/model/review_model.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/review_repository.dart';
import 'package:subping/repository/subscribe_repository.dart';

class MyReviewHistoryViewModel extends GetxController {
  ReviewRepository reviewRepository = ReviewRepository();
  SubscribeRepository subscribeRepository = SubscribeRepository();
  RxBool reviewLoading = false.obs;
  RxBool subScribeLoading = false.obs;
  RxList<ReviewModel> reviewList = <ReviewModel>[].obs;
  RxList<SubscribeModel> subscribeList = <SubscribeModel>[].obs;

  Future<void> getMySubscribeList() async {
    subscribeList.value = await subscribeRepository.getSubscribes();
  }

  Future<void> getMyReviewHistory() async {
    reviewList.value = await reviewRepository.getReviews();
  }

  Future<void> makeReviewOnlyRating(double rating, String serviceId) async {
    try {
      await reviewRepository.makeReview(
          rating: rating, content: "", serviceId: serviceId);
    } catch (e) {
      ErrorHandler.errorHandler("FailedEnrollReview");
    }
  }

  // Future<void> updateReviewHistory() {}
  @override
  void onInit() {
    super.onInit();
  }
}
