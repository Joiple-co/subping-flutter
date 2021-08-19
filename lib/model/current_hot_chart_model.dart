import 'package:subping/model/service_model.dart';

class CurrentHotChartModel {
  String standardTime;
  List<ServiceModel> serviceRank;

  CurrentHotChartModel(
      {this.standardTime = "00:00", this.serviceRank = const []});

  CurrentHotChartModel.fromJson(Map<String, dynamic> json) {
    List<ServiceModel> items = [];
    standardTime = json['time'].toString();

    json['serviceRank'].forEach((element) {
      items.add(ServiceModel.fromJson(element));
    });
    serviceRank = items;
  }
}
