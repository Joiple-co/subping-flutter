class SubScribeBlockItemModel {
  String subscribeItemStatus;
  String subscribeItemType;
  String serviceImg;
  int subscribeItemPrice;

  SubScribeBlockItemModel(
      {this.subscribeItemStatus,
      this.serviceImg,
      this.subscribeItemPrice,
      this.subscribeItemType});

  SubScribeBlockItemModel.fromJson(Map<String, dynamic> json) {
    subscribeItemStatus = json["subscribeItemStatus"];
    serviceImg = json["serviceImg"];
    subscribeItemPrice = json["subscribeItemPrice"] ?? 0;
    subscribeItemType = json["subscribeItemType"];
  }
}
