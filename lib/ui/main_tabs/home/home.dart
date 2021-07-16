import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/appbar/title_appbar.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/home/recent_review.dart';
import 'package:subping/ui/main_tabs/home/recommand.dart';
import 'package:subping/viewmodel/global/hot_chart_viewmodel.dart';
import '../../../viewmodel/local/main_tabs/home/home_view_model.dart';
import './expected.dart';
import './recommand.dart';
import './chart.dart';

class Home extends StatelessWidget {
  const Home() : super();
  @override
  Widget build(BuildContext context) {
    final serviceChartViewModel = Get.find<HotChartViewModel>();
    serviceChartViewModel.updateCharts();

    return Scaffold(
      appBar: TitleAppBar(
        "홈",
        hasBackButton: false,
      ),
      body: Obx(
        () => HeaderSafe(
            hasBottomSafe: false,
            child: ListView(
              children: [
                Space(size: SubpingSize.large40),
                Expected(),
                Space(size: SubpingSize.large80),
                Recommand(),
                Space(size: SubpingSize.large80),
                Chart(
                    limitItem:
                        serviceChartViewModel.chart.serviceRank.length >= 3
                            ? 3
                            : serviceChartViewModel.chart.serviceRank.length,
                    hotChartData: serviceChartViewModel.chart),
                Space(size: SubpingSize.large80),
                RecentReview(),
                Space(size: SubpingSize.large80),
              ],
            )),
      ),
    );
  }
}
