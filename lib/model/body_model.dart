class BodyModel {
  bool success;
  dynamic message;

  BodyModel({this.success, this.message});

  BodyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'] ?? false;
  }
}
