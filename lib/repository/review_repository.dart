import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/review_model.dart';
import 'package:subping/modules/api/api.dart';

class ReviewRepository {
  Future<void> makeReview(
      {double rating, String content, String serviceId}) async {
    try {
      final rawResponse = await API.post("service", "/makeReview",
          body: {"rating": rating, "content": content, "serviceId": serviceId});
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteReview({String reviewId}) async {
    try {
      final rawResponse = await API.post("service", "/deleteReview",
          body: {"reviewId": "8d52b1fd-90c4-4770-bf6b-c8233617697c"});
    } catch (e) {
      print(e);
    }
  }

  Future<void> editReview(
      {String reviewId, double rating, String content}) async {
    try {
      final rawResponse = await API.post("service", "/editReview",
          body: {"reviewId": "8d52b1fd-90c4-4770-bf6b-c8233617697c"});
    } catch (e) {
      print(e);
    }
  }

  Future<List<ReviewModel>> getReviews({
    String serviceId,
  }) async {
    List<ReviewModel> reviews = <ReviewModel>[];

    try {
      final rawResponse = await API.post(
        "service",
        "/getReviews",
      );

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        print(response.message);
        for (var review in response.message) {
          reviews.add(ReviewModel.fromJson(review));
        }
        return reviews;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> getRecentReviews() async {}
}
