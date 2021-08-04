import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class RankChartItem extends StatelessWidget {
  final int rank;
  final int lastRank;
  final String serviceName;
  final String serviceSummary;
  final String serviceLogoUrl;
  final List<dynamic> serviceTags;

  RankChartItem(
      {this.rank,
      this.lastRank,
      this.serviceName,
      this.serviceSummary,
      this.serviceLogoUrl,
      this.serviceTags});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 40.h, 0, 40.h),
              decoration: BoxDecoration(
                border: rank != lastRank
                    ? Border(
                        bottom:
                            BorderSide(width: 2, color: SubpingColor.black30))
                    : null,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      RankShape(rank),
                      Space(
                        size: SubpingSize.medium16,
                      )
                    ],
                  ),
                  Space(size: SubpingSize.large30),
                  Container(
                    width: 150.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(this.serviceLogoUrl)),
                    ),
                  ),
                  Space(size: SubpingSize.large30),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubpingText(this.serviceName,
                            size: SubpingFontSize.body1),
                        SubpingText(this.serviceSummary,
                            size: SubpingFontSize.body4),
                        Space(size: SubpingSize.medium22),
                        Row(
                          children: List.generate(serviceTags.length, (index) {
                            bool marginFlag = index == serviceTags.length;
                            return PoundButton(
                              serviceTags[index],
                              marginFlag: marginFlag,
                            );
                          }),
                        )
                      ])
                ],
              ),
            )));
  }
}
