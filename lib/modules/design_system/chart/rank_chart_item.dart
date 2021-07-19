import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class RankChartItem extends StatelessWidget {
  final int rank;
  final String serviceName;
  final String serviceSummary;
  final String serviceSquareLogoUrl;
  final List<dynamic> serviceTags;

  RankChartItem(
      {this.rank,
      this.serviceName,
      this.serviceSummary,
      this.serviceSquareLogoUrl,
      this.serviceTags});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 40.h, 0, 40.h),
              decoration: BoxDecoration(
                border: rank != 3
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
                          image: NetworkImage(this.serviceSquareLogoUrl)),
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
                          children: this.serviceTags?.map((category) {
                            bool marginFlag =
                                serviceTags.indexOf(category) != 0;
                            return PoundButton(category,
                                marginFlag: marginFlag);
                          }).toList(),
                        )
                      ])
                ],
              ),
            )));
  }
}
