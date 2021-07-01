import 'dart:convert';

import 'package:subping/amplifyconfiguration.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/modules/secure/secure.dart';


class Cognito {
  static final Cognito _instance = Cognito._internal(String.fromEnvironment("stage", defaultValue: "dev"));

  Map<String, dynamic> _awsConfig;

  factory Cognito() {
    return _instance;
  }

  Cognito._internal(String stage) {
    if(stage != null) {
      _awsConfig = jsonDecode(getAmplifyCongig(stage));
    }
    
    else {
      _awsConfig = jsonDecode(getAmplifyCongig("dev"));
    }
  }

  String test() {
    return _awsConfig['api']['plugins']['awsAPIPlugin']['auth']['endpoint'];
  }

  Future<BodyModel> signUpStart(String email, String password) async {
    final secure = Secure();
    final encryptedPassword = await secure.encrpytRSA(password);
  }
}

// Future<BodyModel> signUpStart(String email, String password) async {
//     final secure = Secure();
//     password = "";

//     final response = await API.post("auth", "/signUpStart",
//         body: {"email": email, "password": encryptedPassword}, withAuth: false);

//     final jsonBody = jsonDecode(response.body);
//     BodyModel body = BodyModel.fromJson(jsonBody);

//     return body;
//   }
