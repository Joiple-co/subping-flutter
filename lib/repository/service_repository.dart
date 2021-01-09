import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/api/api.dart';

class ServiceRepository {
  Future<List<ServiceModel>> getCurrentHotChart(num page) async {
    List<ServiceModel> result = [];
    final response =
        await API.post("service", "/currentHotChart", body: {"page": page});

    final decodeData = utf8.decode(response.bodyBytes);
    final jsonBody = jsonDecode(decodeData);
    BodyModel body = BodyModel.fromJson(jsonBody);

    for (final item in body.message) {
      result.add(ServiceModel.fromJson(item));
    }

    return result;
  }

  Future<List<ServiceModel>> getUserRecommendServices(num page) async {
    List<ServiceModel> result = [];
    final response =
        await API.post("service", "/recommendServices", body: {"page": page});

    final decodeData = utf8.decode(response.bodyBytes);
    final jsonBody = jsonDecode(decodeData);
    BodyModel body = BodyModel.fromJson(jsonBody);

    for (final item in body.message) {
      result.add(ServiceModel.fromJson(item));
    }

    return result;
  }
}
