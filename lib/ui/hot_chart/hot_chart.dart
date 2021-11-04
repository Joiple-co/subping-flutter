import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';

class HotChart extends StatelessWidget {
  const HotChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();

    return HeaderSafe(
      hasBottomSafe: false,
      child: Scaffold(
          appBar: TitleAppBar(
            "인기차트",
            hasBackButton: true,
            rear: TimeDisplay(serviceViewModel.chart.standardTime),
          ),
          body: HorizontalPadding(
            child: RefreshIndicator(
              backgroundColor: SubpingColor.white100,
              onRefresh: serviceViewModel.updateCharts,
              child: ListView.builder(
                  itemCount: serviceViewModel.chart.serviceRank.length,
                  itemBuilder: (context, index) {
                    return RankChartItem(
                        service: serviceViewModel.chart.serviceRank[index]);
                  }),
            ),
          )),
    );
  }
}
