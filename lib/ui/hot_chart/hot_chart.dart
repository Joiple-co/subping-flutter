import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/appbar/title_appbar.dart';
import 'package:subping/ui/design_system/chart/rank_chart_item.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/hot_chart_viewmodel.dart';

class HotChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hotChartViewModel = Get.find<HotChartViewModel>();

    return HeaderSafe(
      hasBottomSafe: false,
      child: Scaffold(
          appBar: TitleAppBar(
            "인기차트",
            hasBackButton: true,
          ),
          body: HorizontalPadding(
            child: ListView.builder(
                itemCount: hotChartViewModel.chart.serviceRank.length,
                itemBuilder: (context, index) {
                  return RankChartItem(
                      rank: hotChartViewModel.chart.serviceRank[index].rank,
                      serviceName: hotChartViewModel
                          .chart.serviceRank[index].serviceName,
                      serviceSummary: hotChartViewModel
                          .chart.serviceRank[index].serviceSummary,
                      serviceSquareLogoUrl: hotChartViewModel
                          .chart.serviceRank[index].serviceSquareLogoUrl,
                      serviceTags: hotChartViewModel
                          .chart.serviceRank[index].serviceTags);
                }),
          )),
    );
  }
}
