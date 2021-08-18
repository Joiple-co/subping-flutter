import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';

class HotChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hotChartViewModel = Get.find<ServiceViewModel>();

    return HeaderSafe(
      hasBottomSafe: false,
      child: Scaffold(
          appBar: TitleAppBar(
            "인기차트",
            hasBackButton: true,
            rear: TimeDisplay(hotChartViewModel.chart.standardTime),
          ),
          body: HorizontalPadding(
            child: RefreshIndicator(
              backgroundColor: SubpingColor.white100,
              onRefresh: hotChartViewModel.updateCharts,
              child: ListView.builder(
                  itemCount: hotChartViewModel.chart.serviceRank.length,
                  itemBuilder: (context, index) {
                    return RankChartItem(
                        service: hotChartViewModel.chart.serviceRank[index]);
                  }),
            ),
          )),
    );
  }
}
