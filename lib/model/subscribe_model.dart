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
  String serviceName;
  String serviceLogoUrl;
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
      this.serviceName,
      this.serviceLogoUrl,
      this.createdAt});

  void updateSubscribeModel(SubscribeModel subscribe) {
    id = subscribe.id ?? id;
    subscribeDate = subscribe.subscribeDate ?? subscribeDate;
    expiredDate = subscribe.expiredDate ?? expiredDate;
    reSubscribeDate = subscribe.reSubscribeDate ?? reSubscribeDate;
    period = subscribe.period ?? period;
    userCardId = subscribe.userCardId ?? userCardId;
    addressId = subscribe.addressId ?? addressId;
    serviceId = subscribe.serviceId ?? serviceId;
    subscribeItems = subscribe.subscribeItems ?? subscribeItems;
    serviceLogoUrl = subscribe.serviceLogoUrl ?? serviceLogoUrl;
    serviceName = subscribe.serviceName ?? serviceName;
    createdAt = subscribe.createdAt ?? createdAt;
  }

  SubscribeModel.fromJson(Map<String, dynamic> json) {
    List<SubscribeItem> _subscribeItems = [];

    json['subscribeItems']
        .forEach((item) => {_subscribeItems.add(SubscribeItem.fromJson(item))});

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

    if (json['subscribeItems'][0]['product'] != null &&
        json['subscribeItems'][0]['product']['service'] != null) {
      serviceName = json['subscribeItems'][0]['product']['service']['name'];
      serviceLogoUrl =
          json['subscribeItems'][0]['product']['service']['serviceLogoUrl'];
    }
  }

  num totalPrice() {
    num totalPrice = 0;

    for (var element in subscribeItems) {
      totalPrice += element.amount * element.product.price;
    }

    return totalPrice;
  }
}

class SubscribeItem {
  num amount;
  ProductModel product;

  SubscribeItem({this.amount, this.product});

  SubscribeItem.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    product = ProductModel.fromJson(json['product']);
  }
}
