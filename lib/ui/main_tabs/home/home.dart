import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/loading/subping_loading.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/home/recent_review.dart';
import 'package:subping/ui/main_tabs/home/recommand.dart';
import 'package:subping/modules/design_system/tool_bar/tool_bar.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import './expected.dart';
import './recommand.dart';
import './chart.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviveViewModel = Get.find<ServiceViewModel>();
    final alarmViewModel = Get.find<AlarmsViewModel>();
    final userViewModel = Get.find<UserViewModel>();
    final subscribeViewModel = Get.find<SubscribeViewModel>();

    alarmViewModel.updateAlarm();
    userViewModel.updateInfo();
    userViewModel.updateUserAddresses();
    userViewModel.updateUserCards();
    serviveViewModel.updateCharts();
    subscribeViewModel.getSubscribes();

    return Obx(() => Scaffold(
          backgroundColor: SubpingColor.white100,
          appBar: TitleAppBar(
            "홈",
            hasBackButton: false,
            rear: ToolBar(
                hasSearchIcon: true,
                hasAlarmIcon: true,
                unreadAlarmCount: alarmViewModel.unReadAlarmCount ?? 0),
          ),
          body: HeaderSafe(
            hasBottomSafe: false,
            child: RefreshIndicator(
              onRefresh: () async {
                await serviveViewModel.updateCharts();
                await alarmViewModel.updateAlarm();
              },
              child: serviveViewModel.chartLoading || alarmViewModel.isLoading
                  ? const SubpingLoading()
                  : ListView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        Space(size: SubpingSize.large20),
                        const Expected(),
                        Space(size: SubpingSize.large40),
                        const Recommand(),
                        Space(size: SubpingSize.large40),
                        Chart(
                            limitItem:
                                serviveViewModel.chart.serviceRank.length >= 3
                                    ? 3
                                    : serviveViewModel.chart.serviceRank.length,
                            hotChartData: serviveViewModel.chart),
                        Space(size: SubpingSize.large40),
                        RecentReview(),
                        Space(size: SubpingSize.large40),
                      ],
                    ),
            ),
          ),
        ));
  }
}
