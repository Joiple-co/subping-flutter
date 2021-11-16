import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/user_card_model.dart';
import 'package:subping/modules/design_system/shape/card_icon.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class PaymentCardBottomSheet extends StatelessWidget {
  final Map<String, UserCardModel> cards;
  final String selectedCardId;
  final Function onSelectCard;

  const PaymentCardBottomSheet(
      {Key key, this.cards, this.selectedCardId, this.onSelectCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ...List.generate(cards.length, (index) {
                final cardId = cards.keys.elementAt(index);
                final card = cards[cardId];

                return GestureDetector(
                  onTap: () {
                    onSelectCard(cardId);
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
                                  color: selectedCardId == card.id
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
