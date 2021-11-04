import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/hive/recent_service.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';

class RecentServiceHistoryItem extends StatelessWidget {
  final RecentService service;
  final bool isLast;

  const RecentServiceHistoryItem({this.service, this.isLast, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
        border: isLast
            ? Border(bottom: BorderSide(width: 2, color: SubpingColor.black30))
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Get.toNamed("/serviceDetail/${service.serviceId}"),
              child: Row(
                children: [
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
                  Space(size: SubpingSize.large15),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubpingText(service.serviceName,
                                    size: SubpingFontSize.body1),
                                SubpingText(
                                    Helper.refineDate(
                                        service.createdAt.toString()),
                                    size: SubpingFontSize.body5,
                                    color: SubpingColor.black60)
                              ]),
                          SubpingText(service.serviceSummary,
                              size: SubpingFontSize.body4),
                          Space(size: SubpingSize.medium11),
                          Row(
                            children: List.generate(
                                service.serviceTags != null
                                    ? service.serviceTags.length
                                    : 0, (index) {
                              bool marginFlag = (index != 0);
                              return PoundButton(
                                "#${service.serviceTags[index]}",
                                marginFlag: marginFlag,
                              );
                            }),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
