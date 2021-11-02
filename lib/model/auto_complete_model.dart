import 'package:subping/model/service_model.dart';


class AutoCompleteModel {
  List<TagResult> tagResult = [];
  List<ServiceResult> serviceResult = [];

  AutoCompleteModel({ this.serviceResult, this.tagResult });

  AutoCompleteModel.fromJson(Map<String, dynamic> json) {

    json['serviceResult'].forEach((item) {
      serviceResult.add(ServiceResult.fromJson(item));
    });
    
    json['tagResult'].forEach((item) {
      tagResult.add(TagResult.fromJson(item));
    });

  }
}

class TagResult {
  String tag;

  TagResult.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
  }
}

class ServiceResult extends ServiceModel {
  ServiceResult.fromJson(Map<String, dynamic> json) {
    super.updateServiceModel(ServiceModel.fromJson(json));
  }
}         
