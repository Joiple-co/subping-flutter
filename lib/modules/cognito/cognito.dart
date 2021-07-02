import 'dart:convert';

import 'package:subping/amplifyconfiguration.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
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

  void signUpStart(String email, String password) async {
    final secure = Secure();
    final encryptedPassword = await secure.encrpytRSA(password);
    password = "";

    final rawResponse = await API.post("auth", "/signUpStart", body: {
      "email" : email, "password": encryptedPassword
    });

    Map<String, dynamic> response = jsonDecode(new String.fromCharCodes(rawResponse.data));
    BodyModel data = BodyModel.fromJson(response);
    print(data.message);
    if(data.success) {
    
    }

    else {
      ErrorHandler.errorHandler("default");
    }
  } 

  Future<BodyModel> isDuplicateEmail(String email) async {
    final rawResponse = await API.post("auth", "/emailDuplicate", body: {
      "email": email
    });

    Map<String, dynamic> response = jsonDecode(new String.fromCharCodes(rawResponse.data));
    BodyModel body = BodyModel.fromJson(response);
    return body;
  }
}
