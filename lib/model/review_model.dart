import 'package:subping/model/body_model.dart';

class ReviewModel {
  String id;
  String userEmail;
  String productId;
  String title;
  String content;
  num rating;
  List<String> imagesUrl;

  ReviewModel({this.id, this.userEmail, this.productId, this.title, this.content, this.rating, this.imagesUrl});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userEmail = json['userEmail'];
    productId = json['productId'];
    title = json['title'];
    content = json['content'];
    rating = json['rating'];
    imagesUrl = json['imagesUrl'];
  }
}
