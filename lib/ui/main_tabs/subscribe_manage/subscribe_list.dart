import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
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
                  final serviceId =
                      subscribeViewModel.subscribe.keys.elementAt(index);
                  final subscribe = subscribeViewModel.subscribe[serviceId];

                  return GestureDetector(
                    onTap: () => Get.toNamed(
                        "/subsctribeDetailManage/${subscribe.serviceId}?serviceName=${subscribe.serviceName}"),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: SubpingColor.white100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      subscribe.serviceLogoUrl,
                                      width: 45,
                                      height: 45,
                                    ),
                                  ),
                                  Space(size: SubpingSize.medium10),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SubpingText(
                                            subscribe.serviceName,
                                            size: SubpingFontSize.body3,
                                            fontWeight:
                                                SubpingFontWeight.medium,
                                            color: SubpingColor.black80,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                          Space(
                                            size: SubpingSize.tiny5,
                                          ),
                                          SubpingText(
                                              periodString[subscribe.period],
                                              size: SubpingFontSize.body3,
                                              color: SubpingColor.black60)
                                        ],
                                      ),
                                      SubpingText(
                                        Helper.setComma(
                                                subscribe.totalPrice()) +
                                            "원",
                                        size: SubpingFontSize.body1,
                                        fontWeight: SubpingFontWeight.bold,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              MiniSquareButton(
                                  text: subscribe.getNextPaymentDate() != null
                                      ? "관리"
                                      : "결제 실패",
                                  warning:
                                      subscribe.getNextPaymentDate() == null,
                                  onPressed: () => Get.toNamed(
                                      "/subsctribeDetailManage/${subscribe.serviceId}?serviceName=${subscribe.serviceName}"))
                            ],
                          ),
                          Space(
                            size: SubpingSize.medium12,
                          ),
                          index != subscribeViewModel.subscribe.length - 1
                              ? const SubpingDivider()
                              : Container()
                        ],
                      ),
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
