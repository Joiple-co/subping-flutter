import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/modules/design_system/shape/card_icon.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class SubscribeCard extends StatelessWidget {
  final UserViewModel userViewModel;
  final StartSubscribeViewModel startSubscribeViewModel;

  const SubscribeCard(
      {Key key, this.startSubscribeViewModel, this.userViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(
            size: SubpingSize.medium14,
          ),
          SubpingText(
            "결제 수단",
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.bold,
          ),
          SubpingText(
            "어떤 카드로 결제할까요?",
            size: SubpingFontSize.body4,
            color: SubpingColor.black80,
          ),
          Space(
            size: SubpingSize.medium14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userViewModel.cards[startSubscribeViewModel.selectedCard] !=
                          null
                      ? Row(
                          children: [
                            CardIcon(
                              vendor: cardVendorMapper[userViewModel
                                  .cards[startSubscribeViewModel.selectedCard]
                                  .cardVendor],
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
                                        .cards[startSubscribeViewModel
                                            .selectedCard]
                                        .cardName,
                                    size: SubpingFontSize.body1),
                                SubpingText(
                                    userViewModel
                                        .cards[startSubscribeViewModel
                                            .selectedCard]
                                        .cardVendor,
                                    size: SubpingFontSize.body2,
                                    color: SubpingColor.black60),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Icon(Icons.credit_card,
                                color: SubpingColor.warning100),
                            SubpingText(" 카드를 선택해주세요",
                                size: SubpingFontSize.body1,
                                color: SubpingColor.warning100),
                          ],
                        )
                ],
              ),
            ],
          ),
          Space(
            size: SubpingSize.large20,
          ),
          SquareButton(
              text: "카드 변경하기",
              onPressed: () => Get.bottomSheet(SelectCardBottomSheet(
                    startSubscribeViewModel: startSubscribeViewModel,
                  )),
              type: "outline"),
          Space(
            size: SubpingSize.medium14,
          ),
        ],
      ),
    );
  }
}

class SelectCardBottomSheet extends StatelessWidget {
  final StartSubscribeViewModel startSubscribeViewModel;

  const SelectCardBottomSheet({Key key, this.startSubscribeViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewModel = Get.find<UserViewModel>();

    return Obx(
      () => Container(
        height: 300,
        decoration: BoxDecoration(
            color: SubpingColor.white100,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: HorizontalPadding(
          child: ListView(
            children: [
              Space(
                size: SubpingSize.medium14,
              ),
              SubpingText(
                "결제 수단",
                size: SubpingFontSize.title6,
                fontWeight: SubpingFontWeight.bold,
              ),
              SubpingText(
                "어떤 카드로 결제할까요?",
                size: SubpingFontSize.body4,
                color: SubpingColor.black80,
              ),
              Space(
                size: SubpingSize.medium14,
              ),
              ...List.generate(userViewModel.cards.length, (index) {
                final cardId = userViewModel.cards.keys.elementAt(index);
                final card = userViewModel.cards[cardId];

                return GestureDetector(
                  onTap: () {
                    startSubscribeViewModel.onSelectCard(cardId);
                    Get.back();
                  },
                  child: Container(
                    color: SubpingColor.white100,
                    child: Column(children: [
                      Row(
                        children: [
                          CardIcon(
                            vendor: cardVendorMapper[card.cardVendor],
                            size: 50,
                          ),
                          Space(
                            size: SubpingSize.medium10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubpingText(card.cardName,
                                  size: SubpingFontSize.body1,
                                  color: startSubscribeViewModel.selectedCard ==
                                          card.id
                                      ? SubpingColor.subping100
                                      : SubpingColor.black100),
                              SubpingText(card.cardVendor,
                                  size: SubpingFontSize.body2,
                                  color: SubpingColor.black60),
                            ],
                          ),
                        ],
                      ),
                      Space(size: SubpingSize.medium10)
                    ]),
                  ),
                );
              }),
              Space(size: SubpingSize.medium10),
              SquareButton(
                  text: "+ 카드 추가하기",
                  onPressed: () =>
                      Get.toNamed("/addCard", preventDuplicates: false),
                  type: "outline")
            ],
          ),
        ),
      ),
    );
  }
}
