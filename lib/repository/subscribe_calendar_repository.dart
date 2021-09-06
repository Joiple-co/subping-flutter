import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/subscribe_blcok_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

final fetchData = [
  {
    "date": "2021-10-21",
    "subScribeData": [
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
    ]
  },
  {
    "date": "2021-07-22",
    "subScribeData": [
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
    ]
  },
  {
    "date": "2021-07-23",
    "subScribeData": [
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
    ]
  },
  {
    "date": "2021-08-21",
    "subScribeData": [
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
    ]
  },
  {
    "date": "2021-08-29",
    "subScribeData": [
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
      {"subscribeItemStatus": "구매 상품", "subscribeItemPrice": 9900},
    ]
  }
];

class SubScribeCanlendarRepository {
  Future<List> fetching() async {
    await Future.delayed(Duration(seconds: 2));
    return fetchData;
  }

  Future<List<SubScribeBlockModel>> getCalendarData() async {
    List<SubScribeBlockModel> calendarData = [];
    try {
      final response = await fetching();
      response.forEach((element) {
        calendarData.add(SubScribeBlockModel.fromJson(element));
      });
      return calendarData;
    } catch (e) {
      print(e);
    }
  }
}
