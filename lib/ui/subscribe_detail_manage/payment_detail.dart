import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/modules/design_system/shape/card_icon.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

class PaymentDetail extends StatelessWidget {
  final String serviceId;

  const PaymentDetail({Key key, this.serviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewModel = Get.find<UserViewModel>();
    final subscribeViewModel = Get.find<SubscribeViewModel>();

    return Obx(() {
      final subscribe = subscribeViewModel.subscribe[serviceId];

      if (subscribe == null) {
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
            HorizontalPadding(
              child: Column(
                children: [
                  Space(size: SubpingSize.large20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: "구독 일시정지\n",
                            fontSize: SubpingFontSize.title6,
                            fontWeight: SubpingFontWeight.medium),
                        SubpingTextSpan(
                            text: "결제를 잠깐 쉴 수 있어요",
                            fontSize: SubpingFontSize.body3,
                            color: SubpingColor.black60)
                      ])),
                      MiniSquareButton(text: "정지하기", onPressed: () {})
                    ],
                  ),
                  Space(size: SubpingSize.large20),
                  Container(height: 2, color: SubpingColor.back20),
                  Space(size: SubpingSize.large20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: "구독 취소\n",
                            fontSize: SubpingFontSize.title6,
                            fontWeight: SubpingFontWeight.medium),
                        SubpingTextSpan(
                            text: "구독을 취소할 수 있어요",
                            fontSize: SubpingFontSize.body3,
                            color: SubpingColor.black60)
                      ])),
                      MiniSquareButton(
                        text: "취소하기",
                        onPressed: () {},
                        warning: true,
                      )
                    ],
                  ),
                  Space(size: SubpingSize.large20),
                  Container(height: 2, color: SubpingColor.back20),
                  Space(size: SubpingSize.large20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: "결제카드\n",
                            fontSize: SubpingFontSize.title6,
                            fontWeight: SubpingFontWeight.medium),
                        SubpingTextSpan(
                            text: "결제할 카드를 변경할 수 있어요",
                            fontSize: SubpingFontSize.body3,
                            color: SubpingColor.black60)
                      ])),
                      MiniSquareButton(text: "변경하기", onPressed: () {})
                    ],
                  ),
                  Space(size: SubpingSize.large32),
                  Row(
                    children: [
                      CardIcon(
                        vendor: cardVendorMapper[userViewModel
                            .cards[subscribe.userCardId].cardVendor],
                        size: 50,
                      ),
                      Space(
                        size: SubpingSize.medium10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubpingText(
                              userViewModel
                                  .cards[subscribe.userCardId].cardName,
                              size: SubpingFontSize.body1),
                          SubpingText(
                              userViewModel
                                  .cards[subscribe.userCardId].cardVendor,
                              size: SubpingFontSize.body2,
                              color: SubpingColor.black60),
                        ],
                      ),
                    ],
                  ),
                  Space(size: SubpingSize.large20),
                  Container(height: 2, color: SubpingColor.back20),
                  Space(size: SubpingSize.large20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: "결제 내역",
                            fontSize: SubpingFontSize.title6,
                            fontWeight: SubpingFontWeight.medium),
                      ])),
                      SubpingText(
                          "총 ${Helper.setComma(subscribe.totalPaidPrice())}원",
                          size: SubpingFontSize.title6,
                          fontWeight: SubpingFontWeight.medium),
                    ],
                  ),
                  Space(size: SubpingSize.large32),
                  Column(
                    children: List.generate(subscribe.payments.length, (index) {
                      final payment = subscribe.payments[index];

                      if (!payment.paymentComplete &&
                          payment.paymentFailure == null) {
                        return Container();
                      }

                      if (payment.paymentComplete) {
                        return Column(children: [
                          Row(
                            children: [
                              CardIcon(
                                vendor:
                                    cardVendorMapper[payment.paidCardVendor],
                                size: 50,
                              ),
                              Space(
                                size: SubpingSize.medium10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SubpingText(
                                        "${payment.paymentDate.year}.${payment.paymentDate.month}.${payment.paymentDate.day}",
                                        size: SubpingFontSize.body4,
                                        color: SubpingColor.black60),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SubpingText(
                                              "${payment.paidCardVendor} (${payment.paidCardNumber.substring(0, 4)})",
                                              size: SubpingFontSize.body1),
                                          SubpingText(
                                              "${Helper.setComma(payment.amount)}원",
                                              size: SubpingFontSize.body1),
                                        ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Space(size: SubpingSize.large20)
                        ]);
                      } else {
                        return Container();
                      }
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
