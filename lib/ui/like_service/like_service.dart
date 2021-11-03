import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/like_service/like_service_item.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';
import 'package:subping/viewmodel/local/like_service/like_service_viewmodel.dart';

class LikeService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();
    final likeServiceViewModel = Get.find<LikeServiceViewModel>();
    
    likeServiceViewModel.updateLikeServices();

    return Obx(() => HeaderSafe(
        hasBottomSafe: false,
        child: Scaffold(
            appBar: TitleAppBar(
              "내가 찜한 상품",
              hasBackButton: true,
            ),
            body: HorizontalPadding(
              child: RefreshIndicator(
                key: likeServiceViewModel.refreshIndicatorKey,
                backgroundColor: SubpingColor.white100,
                onRefresh: serviceViewModel.updateLikeServices,
                child: ListView.builder(
                    itemCount: serviceViewModel.likes.length,
                    itemBuilder: (context, index) {
                      return LikeServiceItem(
                          service: serviceViewModel.services[serviceViewModel.likes.elementAt(index)].value,
                          isLast: index == serviceViewModel.likes.length- 1 ? false : true,
                          toggleUserLike: serviceViewModel.toggleUserLike);
                    }),
              ),
            )),
      ),
    );
  }
}
