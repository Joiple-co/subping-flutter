import "dart:convert";
import "dart:io";
import 'dart:typed_data';

import "package:amplify_api/amplify_api.dart";
import "package:amplify_flutter/amplify.dart";
import "package:device_info/device_info.dart";
import "package:package_info/package_info.dart";
import "package:subping/modules/cognito/cognito.dart";
import 'package:subping/modules/error_handler/error_handler.dart';

class API {
  static final List<RestOperation> requests = [];
  static final JSON = JsonEncoder();
  static final cognito = Cognito();

  static Future<Map<String, String>> _makeHeader() async {
    Map<String, String> header = {};
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final String appVersion = packageInfo.version;
    final String buildNumber = packageInfo.buildNumber;

    String deviceName;
    String deviceVersion;
    String deviceId;
    String email;
    String userId;

    if (Platform.isAndroid) {
      AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
      deviceName = deviceInfo.model;
      deviceVersion = deviceInfo.version.toString();
      deviceId = deviceInfo.androidId;
    } else {
      IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;
      deviceName = deviceInfo.model;
      deviceVersion = deviceInfo.systemVersion;
      deviceId = deviceInfo.identifierForVendor;
    }

    final user = await cognito.currentUser(email: true, cognitoId: true);
    email = user['email'];
    userId = user["cognitoId"];

    header = {
      "email": email,
      "id": userId,
      "deviceName": deviceName,
      "deviceVersion": deviceVersion,
      "buildNumber": buildNumber,
      "appVersion": appVersion,
      "deviceId": deviceId,
      "Content-Type": "application/json; charset=utf-8"
    };

    return header;
  }

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<RestResponse> get(String service, String path) async {
    print('[API GET] service : "$service" path : "$path"');

    if (!await API.hasNetwork()) {
      print("[API] No Network");

      for (var request in API.requests) {
        request.cancel();
      }

      ErrorHandler.errorHandler("NoNetworkException");
      return null;
    }

    Map<String, String> header = await _makeHeader();

    try {
      RestOptions options =
          RestOptions(apiName: service, path: path, headers: header);
      RestOperation restOperation = Amplify.API.get(restOptions: options);
      API.requests.add(restOperation);

      return restOperation.response;
    } on ApiException catch (e) {
      print("GET call failed: $e");
    }
  }

  static Future<RestResponse> post(String service, String path,
      {Map<dynamic, dynamic> body}) async {
    print('[API POST] service : "$service" path : "$path"');

    if (!await API.hasNetwork()) {
      print("[API] No Network");

      for (var request in API.requests) {
        request.cancel();
      }

      ErrorHandler.errorHandler("NoNetworkException");
      return null;
    }

    Map<String, String> header = await _makeHeader();

    try {
      String jsonBody = JSON.convert(body);
      Uint8List encoded = utf8.encode(jsonBody);

      RestOptions options = RestOptions(
          apiName: service, path: path, headers: header, body: encoded);
      RestOperation restOperation = Amplify.API.post(restOptions: options);
      API.requests.add(restOperation);

      return restOperation.response;
    } on ApiException catch (e) {
      print("Post call failed: $e");
    }
  }
}
