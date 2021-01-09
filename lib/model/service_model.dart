class ServiceModel {
  String serviceCode;
  String serviceName;
  String serviceSqaureLogoUrl;
  String servicSummary;
  List<dynamic> serviceTags;
  num serviceRating;
  num serviceMinPrice;

  ServiceModel(
      {this.serviceCode,
      this.serviceName,
      this.serviceSqaureLogoUrl,
      this.servicSummary,
      this.serviceTags,
      this.serviceRating,
      this.serviceMinPrice});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    serviceCode = json['serviceCode'];
    serviceName = json['serviceName'];
    serviceSqaureLogoUrl = json['serviceSqaureLogoUrl'];
    servicSummary = json['servicSummary'];
    serviceTags = json['serviceTags'];
    serviceRating = json['serviceRating'];
    serviceMinPrice = json['serviceMinPrice'];
  }
}
