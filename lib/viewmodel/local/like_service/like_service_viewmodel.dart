import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';

class LikeServiceViewModel extends GetxController {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> updateLikeServices() async {
    final serviceViewModel = Get.find<ServiceViewModel>();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => {refreshIndicatorKey.currentState.show()});

    await serviceViewModel.updateLikeServices();
  }
}
