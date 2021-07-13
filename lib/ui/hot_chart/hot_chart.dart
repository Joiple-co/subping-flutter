import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:subping/ui/design_system/appbar/title_appbar.dart';
import 'package:subping/ui/design_system/chart/rank_chart_item.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';

class HotChart extends StatelessWidget {
  CurrentHotChartModel hotChartData;

  HotChart() {
    final arguments = Get.arguments;
    this.hotChartData = arguments;
  }

  @override
  Widget build(BuildContext context) {
    return HeaderSafe(
      hasBottomSafe: false,
      child: Scaffold(
          appBar: TitleAppBar("인기차트", hasBackButton: true,),
          body: HorizontalPadding(
            child: ListView.builder(
                itemCount: hotChartData.serviceRank.length,
                itemBuilder: (context, index) {
                  return RankChartItem(
                      rank: hotChartData.serviceRank[index].rank,
                      serviceName: hotChartData.serviceRank[index].serviceName,
                      serviceSummary:
                          hotChartData.serviceRank[index].serviceSummary,
                      serviceSquareLogoUrl:
                          hotChartData.serviceRank[index].serviceSquareLogoUrl,
                      serviceTags: hotChartData?.serviceRank[index].serviceTags);
                }),
          )),
    );
  }
} 
