import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';

class SubscribeList extends StatelessWidget {
  const SubscribeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscribeViewModel = Get.find<SubscribeViewModel>();

    return Obx(
      () => HorizontalPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space(
              size: SubpingSize.large20,
            ),
            Text.rich(
              SubpingTextSpan(children: [
                SubpingTextSpan(
                    text: "구독 서비스 ",
                    fontSize: SubpingFontSize.title6,
                    fontWeight: SubpingFontWeight.medium),
                SubpingTextSpan(
                    text: "${subscribeViewModel.subscribe.length}개",
                    fontSize: SubpingFontSize.title6,
                    color: SubpingColor.subping100,
                    fontWeight: SubpingFontWeight.medium)
              ]),
            ),
            Space(size: SubpingSize.large20),
            Column(
                children: List.generate(
              subscribeViewModel.subscribe.length,
              (index) {
                return Obx(() {
                  final subscribeId =
                      subscribeViewModel.subscribe.keys.elementAt(index);
                  final subscribe = subscribeViewModel.subscribe[subscribeId];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: SubpingColor.white100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                subscribe.serviceLogoUrl,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Space(size: SubpingSize.tiny6),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubpingText(
                                  subscribe.serviceName,
                                  size: SubpingFontSize.body3,
                                  fontWeight: SubpingFontWeight.medium,
                                ),
                                SubpingText(
                                  Helper.setComma(subscribe.totalPrice()) + "원",
                                  size: SubpingFontSize.body3,
                                  fontWeight: SubpingFontWeight.medium,
                                )
                              ],
                            )
                          ],
                        ),
                        Space(
                          size: SubpingSize.medium12,
                        ),
                      ],
                    ),
                  );
                });
              },
            ))
          ],
        ),
      ),
    );
  }
}
