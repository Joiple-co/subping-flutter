import 'dart:convert';
import 'dart:ffi';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:subping/amplifyconfiguration.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/modules/api/api.dart';
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

  Future<bool> checkLoggedIn() async {
    final user = await Amplify.Auth.fetchAuthSession();
    return user.isSignedIn;
  }

  Future<BodyModel> signUpStart(String email, String password) async {
    final secure = Secure();
    final encryptedPassword = await secure.encrpytRSA(password);
    password = "";

    final rawResponse = await API.post("auth", "/signUpStart", body: {
      "email" : email, "password": encryptedPassword
    });

    Map<String, dynamic> response = jsonDecode(new String.fromCharCodes(rawResponse.data));
    BodyModel data = BodyModel.fromJson(response);

    return data;
  } 

  Future<BodyModel> signUpDone({String name, String phoneNumber, String carrier, String ci, String birthday, String gender}) async{
    final rawResponse = await API.post("auth", "/signUpDone",
        body: {
          "name": name,
          "phoneNumber": phoneNumber,
          "birthDay": birthday,
          "carrier": carrier,
          "ci": ci,
          "gender": gender,
        });

    Map<String, dynamic> response = jsonDecode(new String.fromCharCodes(rawResponse.data));
    BodyModel body = BodyModel.fromJson(response);

    return body;
  }

  Future<SignInResult> signIn(String email, String password) async {
    try {
      SignInResult result = await Amplify.Auth.signIn(
        username: email.trim(), 
        password: password.trim());

      return result;
    } on AuthException catch(e) {
      print(e.message);
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

  Future<Map<String, String>> currentUser({
    email: bool,
    name: bool
  }) async {
    var result = {
      "email": "",
      "name": ""
    };

    if(await checkLoggedIn()) {
      final userAttr = await Amplify.Auth.fetchUserAttributes();

      await Future.forEach(userAttr, (element) { 
        if(email == true && element.userAttributeKey == "email") {
          result["email"] = element.value;
        }

        if(name == true && element.userAttributeKey == "name") {
          result["name"] = element.value;
        }
      });
    }

    return result;
  }
}
