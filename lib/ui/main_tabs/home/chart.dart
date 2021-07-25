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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text.rich(SubpingTextSpan(children: [
                  SubpingTextSpan(
                    text: "인기차트",
                    fontSize: SubpingFontSize.title6,
                    fontWeight: SubpingFontWeight.bold,
                  ),
                ])),

                Space(size: SubpingSize.tiny10),
                Container(
                    padding: EdgeInsets.fromLTRB(15.w, 8.h, 15.w, 8.h),
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 27.w,
                          height: 27.h,
                          child: Image.asset(
                            "assets/icon/clock.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10.w, 0, 0, 5.h),
                          child: SubpingText(hotChartData?.standardTime,
                              fontWeight: SubpingFontWeight.medium,
                              size: SubpingFontSize.body3,
                              color: SubpingColor.black60),
                        )
                      ],
                    ))
              ],
            ),
            GestureDetector(
              onTap: () => Get.toNamed("/hotChart"),
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    SubpingSize.medium20.w, 5.h, SubpingSize.medium20.w, 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: SubpingColor.back20),
                child: SubpingText(
                  '더보기',
                  color: SubpingColor.subping50,
                  size: SubpingFontSize.body3,
                  fontWeight: SubpingFontWeight.bold,
                ),
              ),
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
            )
          ],
        ),
      ])),
    );
  }
}
