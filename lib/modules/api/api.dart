import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:subping/model/response/body_model.dart';

class API {
  static final Map<String, String> _endpoint = {
    "auth": 'https://6d6943fwn7.execute-api.ap-northeast-2.amazonaws.com/dev'
  };
  static final JSON = JsonEncoder();

  static Future<Map<String, String>> _makeHeader() async {
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

    return {
      "appVersion": appVersion,
      "buildNumber": buildNumber,
      "deviceName": deviceName,
      "deviceVersion": deviceVersion,
      "deviceId": deviceId
    };
  }

  static String _makeFullUrl(String endpoint, String path) {
    String fullUrl = "";

    fullUrl += endpoint;
    fullUrl += path;

    print(fullUrl);
    return fullUrl;
  }

  static Future<http.Response> get(String service, String path,
      {bool withAuth = true}) async {
    // 서비스 명 검증
    assert(_endpoint.keys.contains(service), "[Error] Service not defined");

    String endpoint = _endpoint[service];
    Map header = await _makeHeader();
    String url = _makeFullUrl(endpoint, path);

    http.Response response;

    if (withAuth) {
      // 코그니토 필요한 요청일 떄
    } else {
      response = await http.get(url, headers: header);
    }

    print(response.body);

    return response;
  }

  static Future<http.Response> post(String service, String path,
      {bool withAuth = true, Map body}) async {
    // 서비스 명 검증
    assert(_endpoint.keys.contains(service), "[Error] Service not defined");

    String endpoint = _endpoint[service];
    Map header = await _makeHeader();
    String url = _makeFullUrl(endpoint, path);
    String jsonBody = JSON.convert(body);

    http.Response response;

    if (withAuth) {
      // 코그니토 필요한 요청일 떄
    } else {
      response = await http.post(url, headers: header, body: jsonBody);
    }

    return response;
  }

  static Future<http.Response> sendError(dynamic error) {
    String errorString = JSON.convert(error);

    // API.post("")
  }
}
