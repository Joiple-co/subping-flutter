import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/gallery_model.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/review_repository.dart';
import 'package:subping/repository/subscribe_repository.dart';

class WriteReviewViewModel extends GetxController {
  final RxList<GalleryModel> _uploadImages = <GalleryModel>[].obs;
  final Rx<SubscribeModel> _reviewProductData = SubscribeModel().obs;
  final RxString _reviewContent = "".obs;
  final RxBool _loading = false.obs;
  final RxDouble _rating = 5.0.obs;
  final SubscribeRepository _subscribeRepository = SubscribeRepository();
  final ReviewRepository _reviewRepository = ReviewRepository();
  ScrollController reviewScrollController = ScrollController();
  FocusNode reviewFocusNode = FocusNode();

  void onClickDelete(int index) {
    _uploadImages.removeAt(index);
    _uploadImages.refresh();
  }

  Future<void> getSubScribeData(String serviceId) async {
    try {
      _loading.value = true;
      _reviewProductData.value =
          await _subscribeRepository.getSubscribe(serviceId: serviceId);
      _loading.value = false;
    } catch (e) {
      ErrorHandler.errorHandler("dafault");
    }
  }

  Future<void> onSubmitReview({String serviceId}) async {
    try {
      if (_reviewContent.value.length > minReviewLength) {
        await _reviewRepository.makeReview(
            rating: _rating.value,
            content: _reviewContent.value,
            serviceId: serviceId);
      } else {
        ErrorHandler.errorHandler("FillReviewLength");
      }
    } catch (e) {
      ErrorHandler.errorHandler("MakeReviewFail");
    }
  }

  void onChangeReviewContent(String input) {
    _reviewContent.value = input;
  }

  List<GalleryModel> get images => _uploadImages;

  double get rating => _rating.value;

  bool get loading => _loading.value;

  String get reviewContent => _reviewContent.value;

  SubscribeModel get reviewProductData => _reviewProductData.value;

  set uploadImages(List<GalleryModel> tempImageList) =>
      _uploadImages.value = tempImageList;

  set rating(double tempRating) => _rating.value = tempRating;

  @override
  void onInit() {
    super.onInit();
    reviewFocusNode.addListener(() {
      if (reviewFocusNode.hasFocus) {
        Timer(const Duration(milliseconds: 100), () {
          reviewScrollController.position.animateTo(
              reviewScrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease);
        });
      }
    });
  }
}
