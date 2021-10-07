import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/modules/design_system/appbar/title_appbar.dart';
import 'package:subping/modules/design_system/shape/card_icon.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

class CardManagement extends StatelessWidget {
  const CardManagement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewModel = Get.find<UserViewModel>();
    userViewModel.updateUserCards();
    final userCard = userViewModel.cards;

    return Builder(builder: (context) {
      return Obx(() => Scaffold(
            backgroundColor: SubpingColor.white100,
            appBar: TitleAppBar("등록 카드 관리", hasBackButton: true),
            body: RefreshIndicator(
              backgroundColor: SubpingColor.white100,
              onRefresh: userViewModel.updateUserCards,
              child: ListView(children: [
                ...List.generate(userCard.length, (index) {
                  final cardKey = userCard.keys.elementAt(index);
                  
                  return HorizontalPadding(
                    child: Column(children: [
                      Space(size: SubpingSize.medium10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CardIcon(
                                  vendor: CardVendorMapper[
                                      userViewModel.cards[cardKey].cardVendor],
                                  size: 50,
                                ),
                                Space(
                                  size: SubpingSize.medium10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SubpingText(
                                        "${userViewModel.cards[cardKey].cardName}",
                                        size: SubpingFontSize.body1),
                                    SubpingText(
                                        "${userViewModel.cards[cardKey].cardVendor}",
                                        size: SubpingFontSize.body2,
                                        color: SubpingColor.black60),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed("/editAddress/asd",
                                  preventDuplicates: false),
                              child:
                                  Icon(Icons.cancel, color: SubpingColor.black60),
                            ),
                          ]),
                      Space(size: SubpingSize.medium10),
                      Divider()
                    ]),
                  );
                }),
                Space(size: SubpingSize.medium10),
                HorizontalPadding(
                  child: SquareButton(
                      text: "+ 카드 추가하기",
                      onPressed: () =>
                          Get.toNamed("/addCard", preventDuplicates: false),
                      type: "outline"),
                )
              ]),
            ),
          ));
    });
  }
}
