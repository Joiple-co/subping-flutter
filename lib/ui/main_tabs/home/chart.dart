import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/model/current_hot_chart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class Chart extends StatelessWidget {
  final int limitItem;
  final CurrentHotChartModel hotChartData;

  Chart({this.limitItem, this.hotChartData});

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(SubpingTextSpan(children: [
                  SubpingTextSpan(
                    text: "인기차트",
                    fontSize: SubpingFontSize.title4,
                    fontWeight: SubpingFontWeight.bold,
                  ),
                ])),
                Space(size: SubpingSize.medium20),
                TimeDisplay(hotChartData.standardTime)
              ],
            ),
            Container(
              child: Column(
                  children: List.generate(limitItem, (index) {
                return RankChartItem(
                    rank: hotChartData?.serviceRank[index].rank,
                    lastRank: limitItem,
                    serviceName: hotChartData?.serviceRank[index].serviceName,
                    serviceSummary:
                        hotChartData?.serviceRank[index].serviceSummary,
                    serviceSquareLogoUrl:
                        hotChartData?.serviceRank[index].serviceSquareLogoUrl,
                    serviceTags: hotChartData?.serviceRank[index].serviceTags);
              })),
            ),
            Space(
              size: SubpingSize.large30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed("/hotChart"),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        SubpingSize.medium24.w,
                        SubpingSize.tiny14.h,
                        SubpingSize.medium24.w,
                        SubpingSize.tiny14.h),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: SubpingColor.black60),
                        borderRadius: BorderRadius.circular(8)),
                    child: SubpingText(
                      '+ 인기 상품 더보기',
                      color: SubpingColor.black60,
                      size: SubpingFontSize.body4,
                      fontWeight: SubpingFontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
