class ServiceModel {
  String id;
  String category;
  String name;
  String type;
  String serviceLogoUrl;
  String summary;
  String sellerEmail;

  ServiceModel(
      {this.id,
      this.category,
      this.name,
      this.type,
      this.serviceLogoUrl,
      this.summary,
      this.sellerEmail});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    name = json['name'];
    type = json['type'];
    serviceLogoUrl = json['serviceLogoUrl'];
    summary = json['summary'];
    sellerEmail = json['sellerEmail'];
  }
}
