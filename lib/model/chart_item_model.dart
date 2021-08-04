class ChartItemModel {
  int rank;
  String serviceName;
  String serviceSummary;
  String serviceCode;
  String serviceLogoUrl;
  List<dynamic> serviceTags;

  ChartItemModel(
      {this.rank,
      this.serviceName,
      this.serviceSummary,
      this.serviceLogoUrl,
      this.serviceCode,
      this.serviceTags});

  ChartItemModel.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    serviceCode = json['id'];
    serviceName = json['name'];
    serviceLogoUrl = json['serviceLogoUrl'];
    serviceSummary = json['summary'];
    serviceTags = json['tag'];
  }
}
