//import 'dart:developer';

import 'package:subping/model/service_model.dart';

class SearchModel {
  List<ServiceResult> serviceResult = [];

  SearchModel({ this.serviceResult});

  SearchModel.fromJson(Map<String, dynamic> json) {
    
    json['serviceResult'].forEach((item) {
      serviceResult.add(ServiceResult.fromJson(item));
    });
    print(serviceResult);
  }
}

class ServiceResult extends ServiceModel {
  //SearchProperty search;

  ServiceResult.fromJson(Map<String, dynamic> json) {
    super.updateServiceModel(ServiceModel.fromJson(json));
   // search = SearchProperty.fromJson(json['search']);
  }
} 

// class SearchProperty {
//   int matchedIndex;
//   int length;

//   SearchProperty.fromJson(Map<String, dynamic> json) {
//     matchedIndex = json["matchedIndex"];
//     length = json["length"];
//   }
// }

// class ReviewResult {
//   String tag;
//   SearchProperty search;

//   ReviewResult.fromJson(Map<String, dynamic> json) {
//     tag = json['tag'];
//     search = SearchProperty.fromJson(json['search']);
//   }
// }