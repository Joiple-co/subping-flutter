class ChartItemModel {
  int rank;
  String serviceName;
  String serviceSummary;
  String serviceCode;
  String serviceSquareLogoUrl;
  List<dynamic> serviceTags;

  ChartItemModel(
      {this.rank,
      this.serviceName,
      this.serviceSummary,
      this.serviceSquareLogoUrl,
      this.serviceCode,
      this.serviceTags});

  ChartItemModel.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    serviceCode = json['serviceCode'];
    serviceName = json['serviceName'];
    serviceSquareLogoUrl = json['serviceSquareLogoUrl'];
    serviceSummary = json['serviceSummary'];
    serviceTags = json['serviceTags'];
  }
}
