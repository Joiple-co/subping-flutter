import 'package:subping/const/const.dart';
import 'package:subping/model/product_model.dart';

class SubscribeModel {
  String id;
  String subscribeDate;
  String expiredDate;
  String reSubscribeDate;
  Period period;
  String createdAt;
  String userCardId;
  String addressId;
  String serviceId;
  List<SubscribeItem> subscribeItems;

  SubscribeModel(
      {this.id,
      this.subscribeDate,
      this.expiredDate,
      this.reSubscribeDate,
      this.period,
      this.userCardId,
      this.addressId,
      this.serviceId,
      this.subscribeItems,
      this.createdAt});

  SubscribeModel.fromJson(Map<String, dynamic> json) {
    List<SubscribeItem> _subscribeItems = [];

    json['subscribeItems'].forEach((item) => {
      _subscribeItems.add(SubscribeItem.fromJson(item))
    });

    id = json["id"];
    subscribeDate = json['subscribeDate'];
    expiredDate = json['expiredDate'];
    reSubscribeDate = json['reSubscribeDate'];
    period = PeriodMapper[json['period']];
    createdAt = json['createdAt'];
    userCardId = json['userCardId'];
    addressId = json['addressId'];
    serviceId = _subscribeItems[0].product.serviceId;
    subscribeItems = _subscribeItems;
  }
}

class SubscribeItem {
  num amount;
  ProductModel product;

  SubscribeItem({
    this.amount,
    this.product
  });
  
  SubscribeItem.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    product = ProductModel.fromJson(json['product']);
  }
}
