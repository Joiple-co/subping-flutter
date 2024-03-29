import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class LikeServiceItem extends StatelessWidget {
  final ServiceModel service;
  final bool isLast;
  final Function toggleUserLike;

  const LikeServiceItem(
      {this.service, this.isLast, this.toggleUserLike, Key key})
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
              onTap: () => Get.toNamed("/serviceDetail/${service.id}"),
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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubpingText(service.name, size: SubpingFontSize.body1),
                        SubpingText(service.summary,
                            size: SubpingFontSize.body4),
                        Space(size: SubpingSize.medium11),
                        Row(
                          children: List.generate(
                              service.tag != null ? service.tag.length : 0,
                              (index) {
                            bool marginFlag = (index != 0);
                            return PoundButton(
                              "#${service.tag[index]}",
                              marginFlag: marginFlag,
                            );
                          }),
                        )
                      ]),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => toggleUserLike(service.id),
            child: service.like
                ? SizedBox(
                    width: 55,
                    height: 55,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:
                          Icon(Icons.favorite, color: SubpingColor.warning100),
                    ),
                  )
                : SizedBox(
                    width: 55,
                    height: 55,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child:
                            Icon(Icons.favorite, color: SubpingColor.black60)),
                  ),
          ),
        ],
      ),
    ));
  }
}
