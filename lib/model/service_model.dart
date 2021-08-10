class ServiceModel {
  String id;
  List<dynamic> category;
  int rank;
  String name;
  String type;
  String serviceLogoUrl;
  String summary;
  String sellerEmail;
  List<dynamic> tag;

  ServiceModel(
      {this.id,
      this.category,
      this.name,
      this.type,
      this.serviceLogoUrl,
      this.summary,
      this.sellerEmail,
      this.tag});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    rank = json['rank'];
    name = json['name'];
    type = json['type'];
    serviceLogoUrl = json['serviceLogoUrl'];
    summary = json['summary'];
    sellerEmail = json['sellerEmail'];
    tag = json['tag'];
  }
}
