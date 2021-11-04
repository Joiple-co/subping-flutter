import 'package:subping/model/service_model.dart';

class SearchModel {
  List<TagResult> tagResult = [];
  List<ServiceResult> serviceResult = [];

  SearchModel({this.tagResult, this.serviceResult});

  SearchModel.fromJson(Map<String, dynamic> json) {
    json['tagResult'].forEach((item) {
      tagResult.add(TagResult.fromJson(item));
    });

    json['serviceResult'].forEach((item) {
      serviceResult.add(ServiceResult.fromJson(item));
    });
  }
}

class SearchProperty {
  int matchedIndex;
  int length;

  SearchProperty.fromJson(Map<String, dynamic> json) {
    matchedIndex = json["matchedIndex"];
    length = json["length"];
  }
}

class TagResult {
  String tag;
  SearchProperty search;

  TagResult.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    search = SearchProperty.fromJson(json['search']);
  }
}

class ServiceResult extends ServiceModel {
  SearchProperty search;

  ServiceResult.fromJson(Map<String, dynamic> json) {
    super.updateServiceModel(ServiceModel.fromJson(json));
    search = SearchProperty.fromJson(json['search']);
  }
}
