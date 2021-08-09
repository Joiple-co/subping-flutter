import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:subping/model/alarms/alarms_model.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class AlarmRepository {
  Future<AlarmsModel> getAlarm() async {
    try {
      final rawResponse = await API.get("user", "/getAlarm");
      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));
      if (!response.success) {
        ErrorHandler.errorHandler(response.message);
      } else {
        return AlarmsModel.fromJson(response.message);
      }
    } catch (e) {
      ErrorHandler.errorHandler("default");
      return AlarmsModel();
    }
  }

  Future<void> readAlarm() async {
    try {
      final rawResponse = await API.get("user", "/readAlarm");
      final decodedResponse = utf8.decode(rawResponse.data);
      print(decodedResponse);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));
      if (!response.success) {}
    } catch (e) {
      print(e);
    }
  }
}
