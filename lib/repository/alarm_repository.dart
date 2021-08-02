import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:subping/model/alarms/alarms_model.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/modules/api/api.dart';

class AlarmRepository {
  Future<AlarmsModel> getAlarm() async {
    try {
      final rawResponse = await API.get("user", "/getAlarm");

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));
      return AlarmsModel.fromJson(response.message);
    } catch (e) {
      print(e);
    }
  }
}
