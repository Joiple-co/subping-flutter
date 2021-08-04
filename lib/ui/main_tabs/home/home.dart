import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/loading/subping_loading,.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/home/recent_review.dart';
import 'package:subping/ui/main_tabs/home/recommand.dart';
import 'package:subping/ui/main_tabs/home/tool_bar.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';
import 'package:subping/viewmodel/global/hot_chart_viewmodel.dart';
import './expected.dart';
import './recommand.dart';
import './chart.dart';

class Home extends StatelessWidget {
  const Home() : super();

  @override
  Widget build(BuildContext context) {
    final serviceChartViewModel = Get.find<HotChartViewModel>();
    final alarmViewModel = Get.find<AlarmsViewModel>();

    return Obx(() => Scaffold(
          backgroundColor: SubpingColor.white100,
          appBar: TitleAppBar(
            "홈",
            hasBackButton: false,
            rear: ToolBar(
              unreadAlarmCount: alarmViewModel.alarmIsLoading
                  ? 0
                  : alarmViewModel.alarms.value.unreadAlarms,
            ),
          ),
          body: HeaderSafe(
            hasBottomSafe: false,
            child: RefreshIndicator(
              onRefresh: () async {
                await serviceChartViewModel.updateCharts();
                await alarmViewModel.updateAlarm();
              },
              child: serviceChartViewModel.isLoading
                  ? SubpingLoading()
                  : ListView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        Space(size: SubpingSize.large40),
                        Expected(),
                        Space(size: SubpingSize.large80),
                        Recommand(),
                        Space(size: SubpingSize.large80),
                        Chart(
                            limitItem: serviceChartViewModel
                                        .chart.serviceRank.length >=
                                    3
                                ? 3
                                : serviceChartViewModel
                                    .chart.serviceRank.length,
                            hotChartData: serviceChartViewModel.chart),
                        Space(size: SubpingSize.large80),
                        RecentReview(),
                        Space(size: SubpingSize.large80),
                      ],
                    ),
            ),
          ),
        ));
  }
}
