import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/api/api.dart';

class ServiceRepository {

  Future<Map<String, List<ServiceModel>>> getServices() async {
    Map<String, List<ServiceModel>> services = <String, List<ServiceModel>>{};

    try {
      final rawResponse = await API.post("service", "/getServices", body: {});
      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse)); 

      response.message.forEach((key, value) { 
        List<ServiceModel> servicesOfKey = [];

        value.forEach((element) {
          servicesOfKey.add(ServiceModel.fromJson(element));
        });

        services[key] = servicesOfKey;
      });

      return services;
    } catch(e) {
      print(e);
    }
  }
}
