import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/search_model.dart';
import 'package:subping/modules/api/api.dart';

class SearchRepository {
  Future<SearchModel> getSearch(String requestWord) async {
    try {
      final rawResponse = await API
          .post("service", "/search", body: {"requestWord": requestWord});

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      return SearchModel.fromJson(response.message);
    } catch (e) {
      return SearchModel();
    }
  }
}
