import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/service_datail/service_detail.dart';

class RankChartItem extends StatelessWidget {
  final ServiceModel service;
  final int lastRank;

  RankChartItem({this.service, this.lastRank});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            onTap: () => Get.to(ServiceDetail(
                  service: service,
                )),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 40.h, 0, 40.h),
              decoration: BoxDecoration(
                border: service.rank != lastRank
                    ? Border(
                        bottom:
                            BorderSide(width: 2, color: SubpingColor.black30))
                    : null,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      RankShape(service.rank),
                      Space(
                        size: SubpingSize.medium16,
                      )
                    ],
                  ),
                  Space(size: SubpingSize.large30),
                  Container(
                    width: 150.w,
                    height: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(service.serviceLogoUrl)),
                    ),
                  ),
                  Space(size: SubpingSize.large30),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubpingText(service.name, size: SubpingFontSize.body1),
                        SubpingText(service.summary,
                            size: SubpingFontSize.body4),
                        Space(size: SubpingSize.medium22),
                        Row(
                          children: List.generate(service.tag.length, (index) {
                            bool marginFlag = index == service.tag.length;
                            return Row(children: [
                              PoundButton(
                                service.tag[index],
                                marginFlag: marginFlag,
                              ),
                              Space(size: SubpingSize.tiny14)
                            ]);
                          }),
                        )
                      ])
                ],
              ),
            )));
  }
}
