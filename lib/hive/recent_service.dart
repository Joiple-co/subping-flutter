import "package:hive/hive.dart";

part 'recent_service.g.dart';

@HiveType(typeId: 0)
class RecentService {
  @HiveField(0)
  String serviceId;

  @HiveField(1)
  String serviceName;

  @HiveField(2)
  String serviceSummary;

  @HiveField(3)
  String serviceLogoUrl;

  @HiveField(4)
  List<dynamic> serviceTags;

  @HiveField(5)
  DateTime createdAt;

  RecentService(this.serviceId, this.serviceName, this.serviceSummary,
      this.serviceLogoUrl, this.serviceTags, this.createdAt);
}
