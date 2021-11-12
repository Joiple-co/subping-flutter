import 'package:subping/const/const.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/model/payment_model.dart';

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
  List<SubscribeItem> subscribeReserved;
  List<PaymentModel> payments;

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
      this.subscribeReserved,
      this.payments,
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
    subscribeReserved = subscribe.subscribeReserved ?? subscribeReserved;
    payments = subscribe.payments ?? payments;
    serviceLogoUrl = subscribe.serviceLogoUrl ?? serviceLogoUrl;
    serviceName = subscribe.serviceName ?? serviceName;
    createdAt = subscribe.createdAt ?? createdAt;
  }

  SubscribeModel.fromJson(Map<String, dynamic> json) {
    List<SubscribeItem> _subscribeItems = [];
    List<SubscribeItem> _subscribeReserved = [];
    List<PaymentModel> _payments = [];

    json['subscribeItems'].forEach((item) {
      if (!item['reserved']) {
        _subscribeItems.add(SubscribeItem.fromJson(item));
      } else {
        _subscribeReserved.add(SubscribeItem.fromJson(item));
      }
    });

    json['payments']
        .forEach((item) => _payments.add(PaymentModel.fromJson(item)));

    _payments.sort((a, b) => b.paymentDate.compareTo(a.paymentDate));

    id = json["id"];
    subscribeDate = json['subscribeDate'];
    expiredDate = json['expiredDate'];
    reSubscribeDate = json['reSubscribeDate'];
    period = periodMapper[json['period']];
    createdAt = json['createdAt'];
    userCardId = json['userCardId'];
    addressId = json['addressId'];
    serviceId = _subscribeItems[0].product.serviceId;
    subscribeItems = _subscribeItems;
    subscribeReserved = _subscribeReserved;
    payments = _payments;

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

  num totalReservedPrice() {
    num totalPrice = 0;

    for (var element in subscribeReserved) {
      totalPrice += element.amount * element.product.price;
    }

    return totalPrice;
  }

  num totalPaidPrice() {
    num totalPrice = 0;

    for (var element in payments) {
      if (element.paymentComplete) {
        totalPrice += element.amount;
      }
    }

    return totalPrice;
  }

  DateTime getNextPaymentDate() {
    DateTime nextPayment = payments[0].paymentDate;

    if (payments[0].paymentFailure) {
      return null;
    }

    return nextPayment;
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
