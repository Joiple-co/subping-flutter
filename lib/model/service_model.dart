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
  bool like;
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
      this.like,
      this.tag});

  void updateServiceModel(ServiceModel service) {
    id = service.id ?? this.id;
    category = service.category ?? this.category;
    rank = service.rank ?? this.rank;
    name = service.name ?? this.name;
    type = service.type ?? this.type;
    serviceLogoUrl = service.serviceLogoUrl ?? this.serviceLogoUrl;
    summary = service.summary ?? this.summary;
    sellerEmail = service.sellerEmail ?? this.sellerEmail;
    tag = service.tag ?? this.tag;
    serviceExplainUrl = service.serviceExplainUrl ?? this.serviceExplainUrl;
    like = service.like ?? this.like;
  }

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
    like = json['like'] == 1 ? true : false;
  }
}
