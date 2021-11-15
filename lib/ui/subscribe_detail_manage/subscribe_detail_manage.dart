import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'dart:math' as math;
import 'package:subping/viewmodel/local/subsctibe_detail_manage/subscribe_detail_manage_viewmodel.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/ui/subscribe_detail_manage/subscribe_detail.dart';
import 'package:subping/ui/subscribe_detail_manage/payment_detail.dart';

class SubscribeDetailManage extends StatelessWidget {
  final serviceId = Get.parameters['param'];
  final serviceName = Get.parameters['serviceName'];

  SubscribeDetailManage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();
    final subscribeViewModel = Get.find<SubscribeViewModel>();
    final subscribeDetailManageViewModel =
        Get.find<SubscribeDetailManageViewModel>();
    final userViewModel = Get.find<UserViewModel>();

    serviceViewModel.updateService(serviceId);
    userViewModel.updateUserCards();

    return Obx(() {
      final subscribe = subscribeViewModel.subscribe[serviceId];

      if (subscribe.getNextPaymentDate() == null) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => {showBottomSheet(context)});
      }

      return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: SubpingColor.white100,
            appBar: TitleAppBar(serviceName, hasBackButton: true),
            body: NestedScrollView(
              headerSliverBuilder: (context, index) {
                return [
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 72,
                        maxHeight: 72,
                        child: Container(
                          color: SubpingColor.white100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: TabBar(
                              labelPadding: EdgeInsets.zero,
                              isScrollable: false,
                              indicatorSize: TabBarIndicatorSize.label,
                              controller:
                                  subscribeDetailManageViewModel.tabController,
                              labelStyle: TextStyle(
                                  fontSize: SubpingFontSize.title6,
                                  fontWeight: SubpingFontWeight.medium),
                              labelColor: SubpingColor.white100,
                              unselectedLabelColor: SubpingColor.black100,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: SubpingColor.subping100),
                              tabs: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                            20,
                                    padding: const EdgeInsets.only(top: 4),
                                    child: const Tab(
                                        child: SubpingText("구독", size: null))),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3 -
                                      20,
                                  padding: const EdgeInsets.only(top: 4),
                                  child: const Tab(
                                      child: SubpingText("결제", size: null)),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3 -
                                      20,
                                  padding: const EdgeInsets.only(top: 4),
                                  child: const Tab(
                                      child: SubpingText("배송", size: null)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ];
              },
              body: TabBarView(
                  controller: subscribeDetailManageViewModel.tabController,
                  children: [
                    SubscribeDetail(
                      serviceId: serviceId,
                    ),
                    PaymentDetail(serviceId: serviceId),
                    Container(),
                  ]),
            )),
      );
    });
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubpingText(
                  "구독 갱신에 실패했어요 😢",
                  size: SubpingFontSize.title5,
                  fontWeight: SubpingFontWeight.medium,
                ),
                SubpingText("다시 결제할 카드를 선택해주세요",
                    size: SubpingFontSize.body4, color: SubpingColor.black80),
              ],
            ),
          );
        });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
