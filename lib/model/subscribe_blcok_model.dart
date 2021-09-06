import 'package:subping/model/subscribe_block_item_model.dart';

class SubScribeBlockModel {
  DateTime date;
  List<SubScribeBlockItemModel> itemList;
  bool firstOfMonth;

  SubScribeBlockModel({this.date, this.itemList, this.firstOfMonth});

  SubScribeBlockModel.fromJson(Map<String, dynamic> json) {
    List<SubScribeBlockItemModel> tempList = [];

    date = DateTime.parse(json["date"]);
    json["subScribeData"].forEach((element) {
      tempList.add(SubScribeBlockItemModel.fromJson(element));
    });
    itemList = tempList;
  }
}
