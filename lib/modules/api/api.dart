import 'dart:convert';
import 'dart:io';

import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:subping/modules/cognito/cognito.dart';

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

    final cognito = Cognito();
    final email = await cognito.getUserEmail();

    return {
      "appVersion": appVersion,
      "buildNumber": buildNumber,
      "deviceName": deviceName,
      "deviceVersion": deviceVersion,
      "deviceId": deviceId,
      "PK": email
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
      final cognito = Cognito();
      final credentials = await cognito.getCredentials();
      if (credentials != null) {
        final awsSigV4Client = AwsSigV4Client(
            credentials.accessKeyId, credentials.secretAccessKey, endpoint,
            sessionToken: credentials.sessionToken, region: 'ap-northeast-2');
        final signedRequest = SigV4Request(awsSigV4Client,
            method: "GET", path: path, headers: header);

        response = await http.get(url, headers: signedRequest.headers);
      } else {
        return null;
      }
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
      final cognito = Cognito();
      final credentials = await cognito.getCredentials();

      if (credentials != null) {
        final awsSigV4Client = AwsSigV4Client(
            credentials.accessKeyId, credentials.secretAccessKey, endpoint,
            sessionToken: credentials.sessionToken, region: 'ap-northeast-2');
        final signedRequest = SigV4Request(awsSigV4Client,
            method: "GET", path: path, headers: header, body: body);

        response = await http.post(url,
            headers: signedRequest.headers, body: signedRequest.body);
      } else {
        return null;
      }
    } else {
      response = await http.post(url, headers: header, body: jsonBody);
    }

    return response;
  }
}
