class ServiceModel {
  String serviceCode;
  String serviceName;
  String serviceSqaureLogoUrl;
  String servicSummary;
  List<dynamic> serviceTags;

  ServiceModel(
      {this.serviceCode,
      this.serviceName,
      this.serviceSqaureLogoUrl,
      this.servicSummary,
      this.serviceTags});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    serviceCode = json['serviceCode'];
    serviceName = json['serviceName'];
    serviceSqaureLogoUrl = json['serviceSqaureLogoUrl'];
    servicSummary = json['servicSummary'];
    serviceTags = json['serviceTags'];
  }
}
