import 'dart:convert';
import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:subping/modules/cognito/cognito.dart';

class API {
  static final JSON = JsonEncoder();

  static Future<RestResponse> get(String service, String path) async {
    final PackageInfo packageInfo = PackageInfo();
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final String appVersion = packageInfo.version;
    final String buildNumber = packageInfo.buildNumber;

    dynamic deviceInfo;
    String deviceName;
    String deviceVersion;
    String deviceId;

    if (Platform.isAndroid) {
      deviceInfo = await deviceInfoPlugin.androidInfo;
      deviceName = deviceInfo.model;
      deviceVersion = deviceInfo.version.toString();
      deviceId = deviceInfo.androidId;
    } else {
      deviceInfo = await deviceInfoPlugin.iosInfo;
      deviceName = deviceInfo.model;
      deviceVersion = deviceInfo.systemVersion;
      deviceId = deviceInfo.identifierForVendor;
    }

    try {
      RestOptions options = RestOptions(path: path, headers: {
        "deviceId": deviceId
      });
      RestOperation restOperation = Amplify.API.get(restOptions: options);
      
      return restOperation.response;
    } on ApiException catch(e) {
      print("GET call failed: $e");
    }
   
  }

}
