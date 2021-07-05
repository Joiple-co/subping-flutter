import "dart:convert";
import "dart:io";
import 'dart:typed_data';

import "package:amplify_api/amplify_api.dart";
import "package:amplify_flutter/amplify.dart";
import "package:device_info/device_info.dart";
import "package:package_info/package_info.dart";
import "package:subping/modules/cognito/cognito.dart";

class API {
  static final JSON = JsonEncoder();

  static Future<Map<String, String>> _makeHeader() async {
    Map<String, String> header = {};
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final String appVersion = packageInfo.version;
    final String buildNumber = packageInfo.buildNumber;

    String deviceName;
    String deviceVersion;
    String deviceId;

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

    header = {
      "deviceName": deviceName,
      "deviceVersion": deviceVersion,
      "buildNumber": buildNumber,
      "appVersion": appVersion,
      "deviceId": deviceId,
      "Content-Type": "application/json; charset=utf-8"
    };

    return header;
  }

  static Future<RestResponse> get(String service, String path) async {
    Map<String, String> header = await _makeHeader();

    try {
      RestOptions options = RestOptions(path: path, headers: header);
      RestOperation restOperation = Amplify.API.get(restOptions: options);

      return restOperation.response;
    } on ApiException catch (e) {
      print("GET call failed: $e");
    }
  }

  static Future<RestResponse> post(
      String service, String path, {Map<dynamic, dynamic> body}) async {
    Map<String, String> header = await _makeHeader();

    try {
      String jsonBody = JSON.convert(body);
      Uint8List encoded = utf8.encode(jsonBody);

      RestOptions options = RestOptions(
          path: path,
          headers: header,
          body: encoded);
      RestOperation restOperation = Amplify.API.post(restOptions: options);
      
      return restOperation.response;
    } on ApiException catch (e) {
      print("Post call failed: $e");
    }
  }
}
