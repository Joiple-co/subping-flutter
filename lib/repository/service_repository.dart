import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class ServiceRepository {
  Future<List<ServiceModel>> getServicesByCategory(
      CategoryModel categoryModel) async {
    List<ServiceModel> services = <ServiceModel>[];

    try {
      final rawResponse = await API.post("service", "/getServices",
          body: {'category': categoryModel.name});

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        response.message.forEach((value) {
          services.add(ServiceModel.fromJson(value));
        });
      }

      return services;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<CurrentHotChartModel> getCurrentChart() async {
    try {
      final rawResponse = await API.post("service", "/currentHotChart", body: {
        "limit": 5,
        "page": 1,
      });
      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        return CurrentHotChartModel.fromJson(response.message);
      } else {
        return CurrentHotChartModel();
      }
    } catch (e) {
      print(e);
      return CurrentHotChartModel();
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
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<ServiceModel> getService(String serviceId) async {
    try {
      final rawResponse = await API
          .post("service", "/getService", body: {"service": serviceId});
      final decodedResponse = utf8.decode(rawResponse.data);

      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      ServiceModel service = ServiceModel.fromJson(response.message[0]);

      return service;
    } catch (e) {
      print(e);
    }
  }

  Future<List<ServiceModel>> getLikeServices() async {
    List<ServiceModel> services = <ServiceModel>[];

    try {
      final rawResponse = await API.get("user", "/getUserLikeServices");

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      response.message.forEach((value) {
        services.add(ServiceModel.fromJson(value));
      });

      return services;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> toggleUserLike(String serviceId, bool toggle) async {
    try {
      final rawResponse = await API.post("user", "/toggleUserLike",
          body: {"serviceId": serviceId, "toggle": toggle});
      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (!response.success) {
        ErrorHandler.errorHandler("ApiRequestException");
        throw "[toggleUserLike] ApiRequestException";
      } else {
        return response.message;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
