import 'package:subping/model/service_model.dart';


class AutoCompleteModel {
  List<TagResult> tagResult = [];
  List<ServiceResult> serviceResult = [];

  AutoCompleteModel({ this.tagResult, this.serviceResult });

  AutoCompleteModel.fromJson(Map<String, dynamic> json) {
    
    json['tagResult'].forEach((item) {
      tagResult.add(TagResult.fromJson(item));
    });

    json['serviceResult'].forEach((item) {
      serviceResult.add(ServiceResult.fromJson(item));
    });
  }
}

class TagResult {
  String tag;
  String serviceId;

  TagResult.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    serviceId = json['serviceId'];
  }
}

class ServiceResult extends ServiceModel {
  ServiceResult.fromJson(Map<String, dynamic> json) {
    super.updateServiceModel(ServiceModel.fromJson(json));
  }
}         
