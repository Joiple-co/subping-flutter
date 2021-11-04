import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:subping/amplifyconfiguration.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/modules/api/api.dart';

class Cognito {
  static final Cognito _instance =
      Cognito._internal(String.fromEnvironment("stage", defaultValue: "dev"));
  Map<String, dynamic> _awsConfig;

  factory Cognito() {
    return _instance;
  }

  Cognito._internal(String stage) {
    if (stage != null) {
      _awsConfig = jsonDecode(getAmplifyCongig(stage));
    } else {
      _awsConfig = jsonDecode(getAmplifyCongig("dev"));
    }
  }

  Future<bool> checkLoggedIn() async {
    try {
      final user = await Amplify.Auth.fetchAuthSession();
      return user.isSignedIn;
    } catch (e) {
      return false;
    }
  }

  Future<SignInResult> signIn(String email, String password) async {
    try {
      SignInResult result = await Amplify.Auth.signIn(
          username: email.trim(), password: password.trim());

      return result;
    } on AuthException catch (e) {
      print(e.message);
      return SignInResult(isSignedIn: false);
    }
  }

  Future<SignUpResult> signUp(
      String email,
      String password,
      Map<String, String> userAttributes,
      Map<String, String> validationData) async {
    try {
      SignUpResult result = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(
              userAttributes: userAttributes, validationData: validationData));

      return result;
    } catch (e) {
      print(e);
      return SignUpResult(isSignUpComplete: false);
    }
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
  }

  Future<BodyModel> isDuplicateEmail(String email) async {
    final rawResponse =
        await API.post("auth", "/emailDuplicate", body: {"email": email});

    Map<String, dynamic> response =
        jsonDecode(String.fromCharCodes(rawResponse.data));
    BodyModel body = BodyModel.fromJson(response);
    return body;
  }

  Future<Map<String, String>> currentUser(
      {email = bool, name = bool, cognitoId = bool}) async {
    var result = {"email": "", "name": "", "cognitoId": ""};

    if (await checkLoggedIn()) {
      final userAttr = await Amplify.Auth.fetchUserAttributes();

      await Future.forEach(userAttr, (element) {
        if (email == true && element.userAttributeKey == "email") {
          result["email"] = element.value;
        }

        if (name == true && element.userAttributeKey == "name") {
          result["name"] = element.value;
        }

        if (cognitoId == true && element.userAttributeKey == "sub") {
          result["cognitoId"] = element.value;
        }
      });
    }

    return result;
  }
}
