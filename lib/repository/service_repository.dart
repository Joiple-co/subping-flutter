import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/modules/api/api.dart';

class ServiceRepository {
  Future<Map<String, List<ServiceModel>>> getServices(CategoryModel categoryModel) async {
    Map<String, List<ServiceModel>> services = <String, List<ServiceModel>>{};

    try {
      final rawResponse = await API.post("service", "/getServices", body: {
        'category': categoryModel.category
      });
      
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
    } catch (e) {
      print(e);
    }
  }

  Future<CurrentHotChartModel> getCurrentChart() async {
    try {
      final rawResponse =
          await API.post("service", "/currentHotChart", body: {});
      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));
      print(response.message);
      return CurrentHotChartModel.fromJson(response.message);
    } catch (e) {
      print(e);
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = <CategoryModel>[];

    try {
      final rawResponse = await API.get("service", "/getCategories");
      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      response.message.forEach((element) {
        CategoryModel categoryModel = CategoryModel.fromJson(element);
        categories.add(categoryModel);
      });

      return categories;
    } catch(e) {
      print(e);
    }
  }
}
