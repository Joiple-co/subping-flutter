import 'package:subping/model/response/body_model.dart';

class RSAModel extends BodyModel {
  String publicKey;

  RSAModel({this.publicKey, message, success})
      : super(message: message, success: success);

  RSAModel.fromJson(Map<String, dynamic> json) {
    publicKey = json['publicKey'];
    super.message = json['message'];
    super.success = json['success'];
  }
}
