class ProductModel {
  String id;
  String serviceId;
  num price;
  String name;
  String summary;
  String productLogoUrl;
  bool available;

  ProductModel({this.id, this.serviceId, this.price, this.name, this.summary, this.productLogoUrl, this.available});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['serviceId'];
    price = json['price'];
    name = json['name'];
    summary = json['summary'];
    productLogoUrl = json['productLogoUrl'];
    available = json['available'] == 1 ? true : false;
  }
}
