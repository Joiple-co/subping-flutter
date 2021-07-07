class ServiceModel {
  String serviceCode;
  String serviceName;
  String serviceSquareLogoUrl;
  String serviceSummary;
  List<dynamic> serviceTags;

  ServiceModel(
      {this.serviceCode,
      this.serviceName,
      this.serviceSquareLogoUrl,
      this.serviceSummary,
      this.serviceTags});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    serviceCode = json['serviceCode'];
    serviceName = json['serviceName'];
    serviceSquareLogoUrl = json['serviceSquareLogoUrl'];
    serviceSummary = json['serviceSummary'];
    serviceTags = json['serviceTags'];
  }
}
