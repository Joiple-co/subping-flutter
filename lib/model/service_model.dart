import 'package:subping/const/const.dart';

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
  bool customizable;
  bool like;
  List<dynamic> tag;
  List<Period> period;

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
      this.customizable,
      this.period,
      this.tag});

  void updateServiceModel(ServiceModel service) {
    id = service.id ?? id;
    category = service.category ?? category;
    rank = service.rank ?? rank;
    name = service.name ?? name;
    type = service.type ?? type;
    serviceLogoUrl = service.serviceLogoUrl ?? serviceLogoUrl;
    summary = service.summary ?? summary;
    sellerEmail = service.sellerEmail ?? sellerEmail;
    tag = service.tag ?? tag;
    serviceExplainUrl = service.serviceExplainUrl ?? serviceExplainUrl;
    like = service.like ?? like;
    customizable = service.customizable ?? customizable;
    period = service.period ?? period;
  }

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
    serviceExplainUrl = json['serviceExplainUrl'];
    like = json['like'] == 1 ? true : false;
    customizable = json["customizable"] == 1 ? true : false;
    period = json['period'] != null
        ? List.generate(json["period"].length,
            (index) => periodMapper[json["period"][index]])
        : null;
  }
}
