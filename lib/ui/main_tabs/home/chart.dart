import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/home/char_item.dart';
import 'package:subping/ui/main_tabs/home/more_chart.dart';

class Chart extends StatelessWidget {
  final int limitItem;
  final CurrentHotChartModel hotChartData;

  Chart({this.limitItem, this.hotChartData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubpingText(
                "인기차트",
                size: SubpingFontSize.title6,
                fontWeight: SubpingFontWeight.medium,
                textAlign: TextAlign.start,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 10.h),
                decoration: BoxDecoration(
                  color: SubpingColor.back20,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 27.w,
                      height: 27.h,
                      child: Image.asset(
                        "assets/icon/clock.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      color: Colors.black12,
                      child: SubpingText(hotChartData?.standardTime,
                          height: 1,
                          fontWeight: SubpingFontWeight.medium,
                          size: SubpingFontSize.body3,
                          color: SubpingColor.subping50),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Column(
                children: List.generate(limitItem, (index) {
              return ChartItem(
                  rank: hotChartData?.serviceRank[index].rank,
                  serviceName: hotChartData?.serviceRank[index].serviceName,
                  serviceSummary:
                      hotChartData?.serviceRank[index].serviceSummary,
                  serviceSquareLogoUrl:
                      hotChartData?.serviceRank[index].serviceSquareLogoUrl,
                  serviceTags: hotChartData?.serviceRank[index].serviceTags);
            })),
          ),
          Space(size: SubpingSize.large80),
          Center(child: MoreChart()),
        ],
      ),
    );
  }
}
