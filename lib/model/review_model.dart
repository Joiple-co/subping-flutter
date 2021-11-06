class ReviewModel {
  String nickName;
  String reviewId;
  String userId;
  String title;
  String serviceId;
  String content;
  String createdAt;
  String updatedAt;
  num rating;
  List<String> reviewImage;

  ReviewModel(
      {this.reviewId,
      this.nickName,
      this.createdAt,
      this.userId,
      this.serviceId,
      this.title,
      this.updatedAt,
      this.content,
      this.rating,
      this.reviewImage});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    reviewId = json['id'];
    userId = json['userId'];
    serviceId = json['serviceId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    title = json['title'];
    content = json['content'];
    rating = json['rating'];
    reviewImage = json['reviewImage'];
  }
}
