import 'package:subping/model/chart_item_model.dart';

class CurrentHotChartModel {
  String standardTime;
  List<ChartItemModel> serviceRank;

  CurrentHotChartModel({this.standardTime = "00:00", this.serviceRank = const []});

  CurrentHotChartModel.fromJson(Map<String, dynamic> json) {
    List<ChartItemModel> items = [];
    standardTime = json['time'].toString() + " : 00";
    json['serviceRank'].forEach((element) {
      items.add(ChartItemModel.fromJson(element));
    });
    serviceRank = items;
  }
}
