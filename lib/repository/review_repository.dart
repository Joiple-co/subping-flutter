import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/review_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class ReviewRepository {
  Future<void> makeReview(
      {double rating, String content, String serviceId}) async {
    try {
      // ignore: unused_local_variable
      final rawResponse = await API.post("service", "/makeReview",
          body: {"rating": rating, "content": content, "serviceId": serviceId});
    } catch (e) {
      ErrorHandler.errorHandler("FailEnrollReview");
    }
  }

  Future<void> deleteReview({String reviewId}) async {
    try {
      // ignore: unused_local_variable
      final rawResponse = await API
          .post("service", "/deleteReview", body: {"reviewId": reviewId});
    } catch (e) {
      ErrorHandler.errorHandler("FailEnrollReview");
    }
  }

  Future<void> editReview(
      {String reviewId, double rating, String content}) async {
    try {
      // ignore: unused_local_variable
      final rawResponse = await API.post("service", "/editReview",
          body: {"reviewId": reviewId, "rating": rating, "content": content});
    } catch (e) {
      ErrorHandler.errorHandler("FailEnrollReview");
    }
  }

  Future<List<ReviewModel>> getReviews({
    String serviceId,
  }) async {
    try {
      final rawResponse =
          await API.post("service", "/getReviews", body: {'serviceId': null});

      List<ReviewModel> reviews = <ReviewModel>[];

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));
      if (response.success) {
        for (var review in response.message) {
          reviews.add(ReviewModel.fromJson(review));
        }
        return reviews;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<void> getRecentReviews() async {}
}
