import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/modules/design_system/shape/card_icon.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/ui/subscribe_detail_manage/payment_card_bottomsheet.dart';
import 'package:subping/ui/subscribe_detail_manage/subscribe_pause_bottomsheet.dart';
import 'package:subping/ui/subscribe_detail_manage/subscribe_pause_indicator.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'package:subping/viewmodel/local/subsctibe_detail_manage/subscribe_detail_manage_viewmodel.dart';

class PaymentDetail extends StatelessWidget {
  final String serviceId;

  const PaymentDetail({Key key, this.serviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewModel = Get.find<UserViewModel>();
    final subscribeViewModel = Get.find<SubscribeViewModel>();
    final subscribeDetailManageViewModel =
        Get.find<SubscribeDetailManageViewModel>();

    return Obx(() {
      final subscribe = subscribeViewModel.subscribe[serviceId];

      if (subscribe == null) {
        return const SubpingLoading();
      }

      return SingleChildScrollView(
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
                            text: subscribe.reSubscribeDate != null
                                ? "결제를 잠깐 쉬고 있어요!"
                                : "결제를 잠깐 쉴 수 있어요",
                            fontSize: SubpingFontSize.body3,
                            color: SubpingColor.black60)
                      ])),
                      MiniSquareButton(
                          warning: subscribe.reSubscribeDate != null,
                          loading: subscribeDetailManageViewModel
                              .isSubscribePauseLoading,
                          text: subscribe.reSubscribeDate != null
                              ? "취소하기"
                              : "정지하기",
                          onPressed: () async {
                            if (subscribe.reSubscribeDate != null) {
                              await subscribeDetailManageViewModel
                                  .updatePauseSubscribe(serviceId, subscribe.id,
                                      cancel: true);
                            } else {
                              Get.bottomSheet(SubscribePauseBottomSheet(
                                subscribe: subscribe,
                              ));
                            }
                          })
                    ],
                  ),
                  Space(size: SubpingSize.large20),
                  subscribe.reSubscribeDate != null
                      ? SubscribePauseIndicator(
                          lastDate: subscribe.getLastPaymentDate(),
                          nextDate: subscribe.getNextPaymentDate())
                      : Container(),
                  subscribe.reSubscribeDate != null
                      ? Space(size: SubpingSize.large20)
                      : Container(),
                  Container(height: 2, color: SubpingColor.back20),
                  Space(size: SubpingSize.large20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: "구독 해지\n",
                            fontSize: SubpingFontSize.title6,
                            fontWeight: SubpingFontWeight.medium),
                        SubpingTextSpan(
                            text: subscribe.reSubscribeDate != null
                                ? "일시정지 중에는 해지가 불가능해요"
                                : "구독을 해지할 수 있어요",
                            fontSize: SubpingFontSize.body3,
                            color: SubpingColor.black60)
                      ])),
                      MiniSquareButton(
                          disabled: subscribe.reSubscribeDate != null,
                          text: "해지하기",
                          onPressed: () async {
                            await subscribeDetailManageViewModel
                                .cancelSubscribe(subscribe.id);
                          },
                          warning: true,
                          loading: subscribeDetailManageViewModel
                              .isSubscribeCancelLoading)
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
                      MiniSquareButton(
                          text: "변경하기",
                          loading: subscribeDetailManageViewModel
                              .isPaymentCardUpdateLoading,
                          onPressed: () =>
                              Get.bottomSheet(PaymentCardBottomSheet(
                                cards: userViewModel.cards,
                                selectedCardId: subscribe.userCardId,
                                onSelectCard: (String cardId) async {
                                  await subscribeDetailManageViewModel
                                      .updatePaymentCard(
                                          serviceId, subscribe.id, cardId);
                                },
                              )))
                    ],
                  ),
                  Space(size: SubpingSize.large20),
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
                  Space(size: SubpingSize.large20),
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
            ),
          ],
        ),
      );
    });
  }
}
