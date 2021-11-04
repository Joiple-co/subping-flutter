import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subping/const/const.dart';
import 'package:subping/methodChannel/subping_method_channel.dart';
import 'package:subping/model/gallery_model.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/review_repository.dart';
import 'package:subping/repository/subscribe_repository.dart';

class WriteReviewViewModel extends GetxController {
  RxList<GalleryModel> _uploadImages = <GalleryModel>[].obs;
  Rx<SubscribeModel> _reviewProductData = SubscribeModel().obs;
  RxString _reviewContent = "".obs;
  RxBool _fillContentLength = false.obs;
  RxBool _loading = false.obs;
  RxDouble _rating = 5.0.obs;
  SubscribeRepository _subscribeRepository = SubscribeRepository();
  ReviewRepository _reviewRepository = ReviewRepository();
  ScrollController reviewScrollController = ScrollController();
  FocusNode reviewFocusNode = FocusNode();

  Future<void> onClickDelete(int index) {
    _uploadImages.value.removeAt(index);
    _uploadImages.refresh();
  }

  Future<void> getSubScribeData(String serviceId) async {
    try {
      _loading.value = true;
      _reviewProductData.value =
          await _subscribeRepository.getSubscribe(serviceId: serviceId);
      _loading.value = false;
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("dafault");
    }
  }

  Future<void> onSubmitReview({String serviceId}) async {
    try {
      if (_reviewContent.value.length > MIN_REVIEW_LENGTH) {
        await _reviewRepository.makeReview(
            rating: _rating.value,
            content: _reviewContent.value,
            serviceId: serviceId);
      } else {
        ErrorHandler.errorHandler("FillReviewLength");
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("MakeReviewFail");
    }
  }

  void onChangeReviewContent(String input) {
    _reviewContent.value = input;
  }

  List<GalleryModel> get images => _uploadImages.value;

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
        Timer(Duration(milliseconds: 100), () {
          reviewScrollController.position.animateTo(
              reviewScrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease);
        });
      }
    });
  }
}
