import 'dart:convert';

import 'package:ntp/ntp.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/model/subscribe_schedule_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class SubscribeRepository {
  Future<String> makeSubscribe(
      {userCardId: String,
      subscribeItems: List,
      addressId: String,
      period: String,
      serviceId: String}) async {
    try {
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

      if (response.success) {
        return "success";
      } else {
        if (response.message == "UserHasSameServiceSubscribeException") {
          return response.message;
        } else if (response.message == "MakeSubscribeException") {
          return response.message;
        } else if (response.message == "PaymentException") {
          return response.message;
        } else {
          return "WrongAccessException";
        }
      }
    } catch (e) {
      return "UnknownException";
    }
  }

  Future<List<SubscribeModel>> getSubscribes() async {
    List<SubscribeModel> subscribes = [];

    final rawResponse = await API.post("user", "/getSubscribe");
    final decodedResponse = utf8.decode(rawResponse.data);
    BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

    if (response.success) {
      response.message.forEach((item) {
        subscribes.add(SubscribeModel.fromJson(item));
      });
    }

    return subscribes;
  }

  Future<SubscribeModel> getSubscribe({serviceId: String}) async {
    SubscribeModel subscribe;

    final rawResponse =
        await API.post("user", "/getSubscribe", body: {"serviceId": serviceId});

    final decodedResponse = utf8.decode(rawResponse.data);
    BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

    if (response.success) {
      subscribe = SubscribeModel.fromJson(response.message[0]);
    }

    return subscribe;
  }

  Future<Map<String, Map<String, List<SubscribeScheduleModel>>>>
      getSubscribeSchedule() async {
    Map<String, Map<String, List<SubscribeScheduleModel>>> schedules = {};

    final rawResponse = await API.get("user", "/getSchedule");
    final decodedResponse = utf8.decode(rawResponse.data);
    BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

    if (response.success) {
      final months = response.message.keys;

      months.forEach((month) {
        schedules[month] = {};
        List<SubscribeScheduleModel> schedulesOfDate = [];

        final scheduleOfMonths = response.message[month];
        final dateOfSchedule = scheduleOfMonths.keys;

        dateOfSchedule.forEach((date) {
          final scheduleOfDate = scheduleOfMonths[date];

          scheduleOfDate.forEach((schedule) {
            schedulesOfDate.add(SubscribeScheduleModel.fromJson(schedule));
          });

          schedules[month][date] = schedulesOfDate;
          schedulesOfDate = [];
        });
      });
    }

    return schedules;
  }
}
