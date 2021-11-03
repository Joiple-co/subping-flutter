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
    id = subscribe.id ?? this.id;
    subscribeDate = subscribe.subscribeDate ?? this.subscribeDate;
    expiredDate = subscribe.expiredDate ?? this.expiredDate;
    reSubscribeDate = subscribe.reSubscribeDate ?? this.reSubscribeDate;
    period = subscribe.period ?? this.period;
    userCardId = subscribe.userCardId ?? this.userCardId;
    addressId = subscribe.addressId ?? this.addressId;
    serviceId = subscribe.serviceId ?? this.serviceId;
    subscribeItems = subscribe.subscribeItems ?? this.subscribeItems;
    serviceLogoUrl = subscribe.serviceLogoUrl ?? this.serviceLogoUrl;
    serviceName = subscribe.serviceName ?? this.serviceName;
    createdAt = subscribe.createdAt ?? this.createdAt;
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

    if(json['subscribeItems'][0]['product'] != null && json['subscribeItems'][0]['product']['service'] != null) {
      serviceName = json['subscribeItems'][0]['product']['service']['name']; 
      serviceLogoUrl =
          json['subscribeItems'][0]['product']['service']['serviceLogoUrl'];
    }
  }


  num totalPrice() {
    num totalPrice = 0;

    subscribeItems.forEach((element) {
      totalPrice += element.amount * element.product.price;
    });

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
