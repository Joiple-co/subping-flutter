import 'package:flutter/material.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/repository/service_repository.dart';

class HomeViewModel with ChangeNotifier {
  List<ServiceModel> currentHotServices = [];
  List<ServiceModel> userRecommendServices = [];

  bool isLoadingHotChart = false;
  bool isLoadingRecommendServices = false;

  void fetchCurrentHotList() async {
    this.isLoadingHotChart = true;
    notifyListeners();

    final currentHotServices = await ServiceRepository().getCurrentHotChart(1);

    this.currentHotServices = currentHotServices;
    this.isLoadingHotChart = false;
    notifyListeners();
  }

  void fetchUserRecommendServices() async {
    this.isLoadingRecommendServices = true;
    notifyListeners();

    final userRecommendServices =
        await ServiceRepository().getUserRecommendServices(1);

    this.userRecommendServices = userRecommendServices;
    this.isLoadingRecommendServices = false;
    notifyListeners();
  }
}
