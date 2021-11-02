import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/model/service_model.dart';

class SubscribeService extends StatelessWidget {
  final ServiceModel service;

  const SubscribeService({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubpingText(
          "구독할 서비스",
          size: SubpingFontSize.title6,
          fontWeight: SubpingFontWeight.bold,
        ),
        Space(
          size: SubpingSize.medium14,
        ),
        Container(
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SubpingText(service.name, size: SubpingFontSize.body1),
                  SubpingText(service.summary, size: SubpingFontSize.body4, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Space(size: SubpingSize.medium11),
                  Row(
                    children: List.generate(service.tag.length, (index) {
                      bool marginFlag = (index != 0);
                      return PoundButton(
                        "#${service.tag[index]}",
                        marginFlag: marginFlag,
                      );
                    }),
                  )
                ]),
              ),
            ],
          ),
        ),
        Space(
          size: SubpingSize.medium14,
        ),
      ],
    );
  }
}
