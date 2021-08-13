import 'package:flutter/material.dart';
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
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                    width: 75,
                    height: 75,
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
                            bool marginFlag = (index != 0);
                            return PoundButton(
                              service.tag[index],
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
