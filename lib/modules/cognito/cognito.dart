import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subping/model/response/body_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/cognito/cognito_store.dart';
import 'package:subping/modules/secure/secure.dart';

class Cognito {
  final CognitoUserPool _userPool =
      CognitoUserPool("ap-northeast-2_VzCrSsELb", "4p168n12vp9vraftlg9d29hlf2");
  String _identityPoolId =
      "ap-northeast-2:399e170b-7fa8-47d7-b5b8-1b4d1a8dd55e";
  CognitoUser _cognitoUser;
  AuthenticationDetails _authenticationDetails;
  CognitoUserSession _session;

  Future<bool> _init() async {
    final prefs = await SharedPreferences.getInstance();
    final storage = CognitoStore(prefs);
    _userPool.storage = storage;
    _cognitoUser = await _userPool.getCurrentUser();

    if (_cognitoUser == null) {
      return false;
    }

    _session = await _cognitoUser.getSession();
    return _session.isValid();
  }

  Future<BodyModel> emailDuplicate(String email) async {
    final response = await API.post("auth", "/emailDuplicate",
        body: {"email": email}, withAuth: false);

    final jsonBody = jsonDecode(response.body);
    BodyModel body = BodyModel.fromJson(jsonBody);

    return body;
  }

  Future<BodyModel> signUpStart(String email, String password) async {
    final secure = Secure();
    final encryptedPassword = await secure.encrpytRSA(password);
    password = "";

    final response = await API.post("auth", "/signUpStart",
        body: {"email": email, "password": encryptedPassword}, withAuth: false);

    final jsonBody = jsonDecode(response.body);
    BodyModel body = BodyModel.fromJson(jsonBody);

    return body;
  }

  Future<BodyModel> signUpDone(
      {String name,
      String phoneNumber,
      String birthDay,
      String carrier,
      String ci}) async {
    final response = await API.post("auth", "/signUpDone",
        body: {
          "name": name,
          "phoneNumber": phoneNumber,
          "birthDay": birthDay,
          "carrier": carrier,
          "ci": ci
        },
        withAuth: false);

    final jsonBody = jsonDecode(response.body);
    BodyModel body = BodyModel.fromJson(jsonBody);

    return body;
  }

  Future<bool> login(String email, String password) async {
    await _init();

    _cognitoUser = CognitoUser(email, _userPool, storage: _userPool.storage);
    _authenticationDetails =
        AuthenticationDetails(username: email, password: password);
    try {
      _session = await _cognitoUser.authenticateUser(_authenticationDetails);
    } catch (e) {
      return false;
    }

    if (!_session.isValid()) {
      return false;
    }

    return true;
  }

  Future<void> signOut() async {
    await _init();
    final credentials = await getCredentials();

    if (credentials != null) {
      await credentials.resetAwsCredentials();
    }
    if (_cognitoUser != null) {
      await _cognitoUser.signOut();
    }
  }

  Future<CognitoCredentials> getCredentials() async {
    await _init();

    if (_cognitoUser == null || _session == null) {
      return null;
    }

    final credentials = CognitoCredentials(_identityPoolId, _userPool);
    await credentials.getAwsCredentials(_session.getIdToken().getJwtToken());
    return credentials;
  }
}
