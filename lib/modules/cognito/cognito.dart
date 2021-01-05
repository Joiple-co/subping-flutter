import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/cognito/cognito_store.dart';
import 'package:subping/modules/secure/secure.dart';

class Cognito {
  final CognitoUserPool _userPool = CognitoUserPool(USER_POOL_ID, CLIENT_ID);
  String _identityPoolId = IDENTITIY_POOL_ID;
  CognitoUser _cognitoUser;
  AuthenticationDetails _authenticationDetails;
  CognitoUserSession _session;

  // 반드시 로그인 된 상태에서 호출되어야 함.
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
      String birthday,
      String carrier,
      String ci}) async {
    final response = await API.post("auth", "/signUpDone",
        body: {
          "name": name,
          "phoneNumber": phoneNumber,
          "birthDay": birthday,
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

  Future<String> getUserEmail() async {
    await _init();

    if (_cognitoUser == null || _session == null) {
      return null;
    }

    final email = (await _cognitoUser.getUserAttributes())[1].value;

    return email;
  }

  Future<String> checkCurrentUserOnboardingStatus() async {
    await _init();

    if (_cognitoUser == null || _session == null) {
      return null;
    }

    try {
      final userOnboardingStepResponse =
          await API.get("auth", "/onboardingStep");

      final jsonBody = jsonDecode(userOnboardingStepResponse.body);
      final body = BodyModel.fromJson(jsonBody);

      if (body.message == "UserAddressNotExistException") {
        return "/onboardingUserAddress";
      } else {
        return "/home";
      }
    } catch (e) {
      throw e;
    }
  }
}
