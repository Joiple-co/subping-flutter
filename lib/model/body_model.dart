class BodyModel {
  bool success;
  String message;

  BodyModel({this.success, this.message});

  BodyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'] == null ? false : json['success'];
  }
}
