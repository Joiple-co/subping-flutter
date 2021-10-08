class SubscribeScheduleModel {
  String serviceId;
  String serviceName;
  List<dynamic> productName;
  String serviceLogoUrl;
  String status;
  num totalPrice;

  SubscribeScheduleModel(
      {this.serviceId,
      this.serviceName,
      this.productName,
      this.serviceLogoUrl,
      this.status,
      this.totalPrice});

  SubscribeScheduleModel.fromJson(Map<String, dynamic> json) {
    serviceId = json["serviceId"];
    serviceName = json["serviceName"];
    productName = json["productName"];
    serviceLogoUrl = json["serviceLogoUrl"];
    status = json["status"];
    totalPrice = json["totalPrice"];
  }
}
