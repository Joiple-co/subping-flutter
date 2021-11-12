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

    return Obx(() {
      final userCard = userViewModel.cards;

      if (userCard.isEmpty) {
        return const SubpingLoading();
      }

      return Scaffold(
        backgroundColor: SubpingColor.white100,
        appBar: const TitleAppBar("등록 카드 관리", hasBackButton: true),
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
                              vendor: cardVendorMapper[
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
                                    userViewModel.cards[cardKey].cardName,
                                    size: SubpingFontSize.body1),
                                SubpingText(
                                    userViewModel.cards[cardKey].cardVendor,
                                    size: SubpingFontSize.body2,
                                    color: SubpingColor.black60),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(AlertDialog(
                                title: const Text("확인이 필요해요!"),
                                content:
                                    const Text("카드 연결이 해지됩니다.\n정말 해지하시겠습니까?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                        userViewModel.deleteCard(
                                            userViewModel.cards[cardKey]);
                                      },
                                      child: SubpingText("확인",
                                          size: SubpingFontSize.body1,
                                          color: SubpingColor.black80)),
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: SubpingText("취소",
                                          size: SubpingFontSize.body1,
                                          color: SubpingColor.subping100))
                                ]));
                          },
                          child:
                              Icon(Icons.cancel, color: SubpingColor.black60),
                        ),
                      ]),
                  Space(size: SubpingSize.medium10),
                  const Divider()
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
      );
    });
  }
}
