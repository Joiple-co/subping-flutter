import 'dart:convert';

import 'package:ntp/ntp.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/api/api.dart';

class SubscribeRepository {
  Future<bool> makeSubscribe({
    userCardId: String,
    subscribeItems: List,
    addressId: String,
    period: String,
    serviceId: String
  }) async {
    final now = (await NTP.now()).toUtc().add(Duration(hours: 9));

    final rawResponse = await API.post("user", "/makeSubscribe", body: {
      "serviceId": serviceId,
      "subscribeProducts": subscribeItems,
      "period": period,
      "subscribeDate": now.toString().split(" ")[0],
      "card": userCardId,
      "address": addressId.length == 0 ? null : addressId
    });

    final decodedResponse = utf8.decode(rawResponse.data);
    BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

    if(response.success) {

    }

    print(response.message);
  } 

  Future<List<SubscribeModel>> getSubscribes() async {
    List<SubscribeModel> subscribes = [];

    final rawResponse = await API.post("user", "/getSubscribe");
    final decodedResponse = utf8.decode(rawResponse.data);
    BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));
    
    if(response.success) {
      response.message.forEach((item) {
        subscribes.add(SubscribeModel.fromJson(item));
      });
    }
    
    return subscribes;
  }

  Future<SubscribeModel> getSubscribe({serviceId: String}) async {
    SubscribeModel subscribe;

    final rawResponse = await API.post("user", "/getSubscribe", body: {
      "serviceId": serviceId
    });

    final decodedResponse = utf8.decode(rawResponse.data);
    BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));
    
    if(response.success) {
      subscribe = SubscribeModel.fromJson(response.message[0]);
    }
    
    return subscribe;
  }
}