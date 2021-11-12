import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/ui/subscribe_detail_manage/subscribe_manage_customize_product.dart';
import 'package:subping/ui/subscribe_detail_manage/subscribe_manage_select_product.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/local/subsctibe_detail_manage/subscribe_detail_manage_viewmodel.dart';

class SubscribeDetail extends StatelessWidget {
  final String serviceId;

  const SubscribeDetail({Key key, this.serviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();
    final subscribeViewModel = Get.find<SubscribeViewModel>();
    final subscribeDetailManageViewModel =
        Get.find<SubscribeDetailManageViewModel>();

    return Obx(() {
      final service = serviceViewModel.services[serviceId];
      final subscribe = subscribeViewModel.subscribe[serviceId];
      final nextPaymentDate = subscribe.getNextPaymentDate();

      if (service == null) {
        return const SubpingLoading();
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 72),
        child: Column(
          children: [
            Container(
              color: SubpingColor.back20,
              height: 10,
            ),
            Space(size: SubpingSize.large20),
            Column(
              children: [
                subscribe.subscribeReserved.isNotEmpty
                    ? HorizontalPadding(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(SubpingTextSpan(children: [
                                  SubpingTextSpan(
                                      text: "변경 예정 상품\n",
                                      fontSize: SubpingFontSize.title6,
                                      fontWeight: SubpingFontWeight.medium),
                                  SubpingTextSpan(
                                      text: "변경 예정 구독 상품이에요",
                                      fontSize: SubpingFontSize.body3,
                                      color: SubpingColor.black60)
                                ])),
                                MiniSquareButton(
                                    text: "취소하기",
                                    loading: subscribeDetailManageViewModel
                                        .isCancelItemChangeLoading,
                                    onPressed: () =>
                                        subscribeDetailManageViewModel
                                            .cancelSubscribeItemChange(
                                                serviceId, subscribe.id))
                              ],
                            ),
                            Space(
                              size: SubpingSize.medium10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: SubpingColor.back20),
                              child: Column(
                                children: List.generate(
                                    subscribe.subscribeReserved.length,
                                    (index) {
                                  final item =
                                      subscribe.subscribeReserved[index];

                                  return Column(children: [
                                    Row(children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.network(
                                            item.product.productLogoUrl),
                                        clipBehavior: Clip.antiAlias,
                                      ),
                                      Space(
                                        size: SubpingSize.tiny7,
                                      ),
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SubpingText(item.product.name,
                                              size: SubpingFontSize.body1),
                                          Text.rich(SubpingTextSpan(children: [
                                            SubpingTextSpan(
                                                text: Helper.setComma(
                                                        item.product.price) +
                                                    "원",
                                                fontSize: SubpingFontSize.body1,
                                                fontWeight:
                                                    SubpingFontWeight.medium,
                                                color: SubpingColor.black80),
                                            service.value.customizable
                                                ? SubpingTextSpan(
                                                    text: " | ",
                                                    fontSize:
                                                        SubpingFontSize.body1,
                                                    color: SubpingColor.black30)
                                                : const SubpingTextSpan(
                                                    text: ""),
                                            service.value.customizable
                                                ? SubpingTextSpan(
                                                    text: Helper.setComma(
                                                            item.amount) +
                                                        "개",
                                                    fontSize:
                                                        SubpingFontSize.body1,
                                                    color: SubpingColor.black80)
                                                : const SubpingTextSpan(
                                                    text: "")
                                          ])),
                                        ],
                                      ))
                                    ]),
                                    index !=
                                            subscribe.subscribeReserved.length -
                                                1
                                        ? Space(
                                            size: SubpingSize.medium10,
                                          )
                                        : Container(),
                                    index !=
                                            subscribe.subscribeReserved.length -
                                                1
                                        ? Container(
                                            width: double.infinity,
                                            height: 1,
                                            color: SubpingColor.black30)
                                        : Container(),
                                    index !=
                                            subscribe.subscribeReserved.length -
                                                1
                                        ? Space(
                                            size: SubpingSize.medium10,
                                          )
                                        : Container()
                                  ]);
                                }),
                              ),
                            ),
                            Space(
                              size: SubpingSize.large20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubpingText("총 구독 금액",
                                    size: SubpingFontSize.body1),
                                SubpingText(
                                    Helper.setComma(
                                            subscribe.totalReservedPrice()) +
                                        "원",
                                    size: SubpingFontSize.body1),
                              ],
                            ),
                            Space(
                              size: SubpingSize.large20,
                            ),
                            subscribe.getNextPaymentDate() != null
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SubpingText("예상 변경 적용일",
                                          size: SubpingFontSize.body1),
                                      SubpingText(
                                          "${subscribe.getNextPaymentDate().year}년 ${subscribe.getNextPaymentDate().month}월 ${subscribe.getNextPaymentDate().day}일",
                                          size: SubpingFontSize.body1),
                                    ],
                                  )
                                : Container(),
                            subscribe.getNextPaymentDate() != null
                                ? Space(size: SubpingSize.large20)
                                : Container(),
                          ],
                        ),
                      )
                    : Container(),
                subscribe.subscribeReserved.isNotEmpty
                    ? Container(
                        color: SubpingColor.back20,
                        height: 10,
                      )
                    : Container(),
                subscribe.subscribeReserved.isNotEmpty
                    ? Space(size: SubpingSize.large20)
                    : Container(),
                HorizontalPadding(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(SubpingTextSpan(children: [
                            SubpingTextSpan(
                                text: "구독 상품\n",
                                fontSize: SubpingFontSize.title6,
                                fontWeight: SubpingFontWeight.medium),
                            SubpingTextSpan(
                                text: "구독중인 상품의 내역입니다",
                                fontSize: SubpingFontSize.body3,
                                color: SubpingColor.black60)
                          ])),
                          MiniSquareButton(
                              text: "변경하기",
                              onPressed: () {
                                if (service.value.customizable) {
                                  Get.to(() => SubscribeManageCustomizeProduct(
                                        serviceId: service.value.id,
                                        subscribeId: subscribe.id,
                                      ));
                                } else {
                                  Get.to(() => SubscribeManageSelectProduct(
                                        serviceId: service.value.id,
                                        subscribeId: subscribe.id,
                                      ));
                                }
                              })
                        ],
                      ),
                      Space(
                        size: SubpingSize.medium10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: SubpingColor.back20),
                        child: Column(
                          children: List.generate(
                              subscribe.subscribeItems.length, (index) {
                            final item = subscribe.subscribeItems[index];

                            return Column(children: [
                              Row(children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                      item.product.productLogoUrl),
                                  clipBehavior: Clip.antiAlias,
                                ),
                                Space(
                                  size: SubpingSize.tiny7,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SubpingText(item.product.name,
                                        size: SubpingFontSize.body1),
                                    Text.rich(SubpingTextSpan(children: [
                                      SubpingTextSpan(
                                          text: Helper.setComma(
                                                  item.product.price) +
                                              "원",
                                          fontSize: SubpingFontSize.body1,
                                          fontWeight: SubpingFontWeight.medium,
                                          color: SubpingColor.black80),
                                      service.value.customizable
                                          ? SubpingTextSpan(
                                              text: " | ",
                                              fontSize: SubpingFontSize.body1,
                                              color: SubpingColor.black30)
                                          : const SubpingTextSpan(text: ""),
                                      service.value.customizable
                                          ? SubpingTextSpan(
                                              text:
                                                  Helper.setComma(item.amount) +
                                                      "개",
                                              fontSize: SubpingFontSize.body1,
                                              color: SubpingColor.black80)
                                          : const SubpingTextSpan(text: "")
                                    ])),
                                  ],
                                ))
                              ]),
                              index != subscribe.subscribeItems.length - 1
                                  ? Space(
                                      size: SubpingSize.medium10,
                                    )
                                  : Container(),
                              index != subscribe.subscribeItems.length - 1
                                  ? Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: SubpingColor.black30)
                                  : Container(),
                              index != subscribe.subscribeItems.length - 1
                                  ? Space(
                                      size: SubpingSize.medium10,
                                    )
                                  : Container()
                            ]);
                          }),
                        ),
                      ),
                      Space(
                        size: SubpingSize.large20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubpingText("총 구독 금액", size: SubpingFontSize.body1),
                          SubpingText(
                              Helper.setComma(subscribe.totalPrice()) + "원",
                              size: SubpingFontSize.body1),
                        ],
                      ),
                      Space(size: SubpingSize.large20),
                    ],
                  ),
                ),
                Container(
                  color: SubpingColor.back20,
                  height: 10,
                ),
                HorizontalPadding(
                    child: Column(children: [
                  Space(size: SubpingSize.large20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: "구독 주기\n",
                            fontSize: SubpingFontSize.title6,
                            fontWeight: SubpingFontWeight.medium),
                        SubpingTextSpan(
                            text: "구독 주기 변경이 가능해요",
                            fontSize: SubpingFontSize.body3,
                            color: SubpingColor.black60)
                      ])),
                      MiniSquareButton(
                        text: "변경하기",
                        loading: subscribeDetailManageViewModel
                            .isPeriodUpdateLoading,
                        onPressed: () {
                          if (service.value.period == null) {
                            serviceViewModel.updateService(serviceId);
                          }

                          Get.bottomSheet(
                            Obx(
                              () => Wrap(children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: SubpingColor.white100,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Space(
                                          size: SubpingSize.medium14,
                                        ),
                                        SubpingText(
                                          "구독 주기",
                                          size: SubpingFontSize.title6,
                                          fontWeight: SubpingFontWeight.bold,
                                        ),
                                        SubpingText(
                                          "얼마나 자주 구독할지 선택할 수 있어요",
                                          size: SubpingFontSize.body4,
                                          color: SubpingColor.black80,
                                        ),
                                        Space(
                                          size: SubpingSize.medium14,
                                        ),
                                        service.value.period != null
                                            ? PeriodRadioSelector(
                                                period: service.value.period,
                                                value: subscribe.period,
                                                onChangeValue: (value) {
                                                  subscribeDetailManageViewModel
                                                      .updatePeriod(
                                                          service.value.id,
                                                          subscribe.id,
                                                          value);

                                                  Get.back();
                                                },
                                              )
                                            : const SubpingLoading(),
                                        Space(
                                          size: SubpingSize.large32,
                                        )
                                      ]),
                                ),
                              ]),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Space(
                    size: SubpingSize.large20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubpingText("구독 주기", size: SubpingFontSize.body1),
                      SubpingText(periodString[subscribe.period],
                          size: SubpingFontSize.body1)
                    ],
                  ),
                  Space(
                    size: SubpingSize.large20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubpingText("다음 구독일", size: SubpingFontSize.body1),
                      nextPaymentDate != null
                          ? SubpingText(
                              "${nextPaymentDate.year.toString()}년 ${nextPaymentDate.month.toString()}월 ${nextPaymentDate.day.toString()}일",
                              size: SubpingFontSize.body1)
                          : SubpingText("결제 실패",
                              color: SubpingColor.warning100,
                              size: SubpingFontSize.body1)
                    ],
                  ),
                ])),
                Space(size: SubpingSize.large40),
              ],
            )
          ],
        ),
      );
    });
  }
}
