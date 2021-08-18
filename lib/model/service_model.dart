class ServiceModel {
  String id;
  List<dynamic> category;
  int rank;
  String name;
  String type;
  String serviceLogoUrl;
  String summary;
  String sellerEmail;
  String serviceExplainUrl;
  List<dynamic> tag;

  ServiceModel(
      {this.id,
      this.category,
      this.name,
      this.rank,
      this.type,
      this.serviceLogoUrl,
      this.summary,
      this.sellerEmail,
      this.serviceExplainUrl,
      this.tag});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] ?? [];
    rank = json['rank'];
    name = json['name'];
    type = json['type'];
    serviceLogoUrl = json['serviceLogoUrl'];
    summary = json['summary'];
    sellerEmail = json['sellerEmail'];
    tag = json['tag'];
    serviceExplainUrl = json['serviceExplainUrl'];
  }
}
