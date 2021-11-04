import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/recent_service_history/recent_service_history_item.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';

class RecentServiceHistory extends StatelessWidget {
  const RecentServiceHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();

    serviceViewModel.updateRecentServices();

    return Obx(() {
      final recentService = serviceViewModel.recentService;

      return HeaderSafe(
        hasBottomSafe: false,
        child: Scaffold(
            appBar: TitleAppBar(
              "최근 본 상품",
              hasBackButton: true,
            ),
            body: HorizontalPadding(
              child: RefreshIndicator(
                backgroundColor: SubpingColor.white100,
                onRefresh: serviceViewModel.updateRecentServices,
                child: ListView.builder(
                    itemCount: serviceViewModel.recentService.length,
                    itemBuilder: (context, index) {
                      return RecentServiceHistoryItem(
                        service: recentService[index],
                        isLast:
                            index == serviceViewModel.recentService.length - 1
                                ? false
                                : true,
                      );
                    }),
              ),
            )),
      );
    });
  }
}
