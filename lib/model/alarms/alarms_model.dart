import 'alarm_content_model.dart';

class AlarmsModel {
  int unreadAlarms;
  List<AlarmContentsModel> contents;

  AlarmsModel({this.unreadAlarms = 0, this.contents = const []});

  AlarmsModel.fromJson(Map<String, dynamic> json) {
    List<AlarmContentsModel> temp = [];
    unreadAlarms = json["unReadCount"];
    json["alarms"].forEach((element) {
      temp.add(AlarmContentsModel.fromJson(element));
    });

    contents = temp;
  }
}
