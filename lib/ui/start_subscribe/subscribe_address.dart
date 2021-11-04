import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class SubscribeAddress extends StatelessWidget {
  final UserViewModel userViewModel;
  final StartSubscribeViewModel startSubscriveViewModel;

  const SubscribeAddress(
      {Key key, this.startSubscriveViewModel, this.userViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addresses = userViewModel.userAddreses;

    return Obx(
      () => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space(
              size: SubpingSize.medium14,
            ),
            SubpingText(
              "배송지",
              size: SubpingFontSize.title6,
              fontWeight: SubpingFontWeight.bold,
            ),
            SubpingText(
              "상품을 어디로 받으실지 정해주세요!",
              size: SubpingFontSize.body4,
              color: SubpingColor.black80,
            ),
            Space(
              size: SubpingSize.medium14,
            ),
            Container(
                child: addresses[startSubscriveViewModel.selectedAddress] !=
                        null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubpingText(
                            addresses[startSubscriveViewModel.selectedAddress]
                                .userName,
                            size: SubpingFontSize.title6,
                          ),
                          Space(
                            size: SubpingSize.tiny5,
                          ),
                          SubpingText(
                              "${addresses[startSubscriveViewModel.selectedAddress].userPhoneNumber}",
                              color: SubpingColor.black60,
                              size: SubpingFontSize.body2),
                          SubpingText(
                              addresses[startSubscriveViewModel.selectedAddress]
                                      .address +
                                  " " +
                                  addresses[startSubscriveViewModel
                                          .selectedAddress]
                                      .detailedAddress,
                              size: SubpingFontSize.body2),
                        ],
                      )
                    : Row(
                        children: [
                          Icon(Icons.local_shipping,
                              color: SubpingColor.warning100),
                          Space(size: SubpingSize.medium10),
                          SubpingText("배송지를 선택해주세요",
                              size: SubpingFontSize.body1,
                              color: SubpingColor.warning100)
                        ],
                      )),
            Space(
              size: SubpingSize.large20,
            ),
            SquareButton(
                text: "주소 변경하기",
                onPressed: () => Get.bottomSheet(Obx(
                      () => Container(
                        decoration: BoxDecoration(
                            color: SubpingColor.white100,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: HorizontalPadding(
                          child: ListView(children: [
                            Space(
                              size: SubpingSize.medium14,
                            ),
                            SubpingText(
                              "배송지",
                              size: SubpingFontSize.title6,
                              fontWeight: SubpingFontWeight.bold,
                            ),
                            SubpingText(
                              "상품을 어디로 받으실지 정해주세요!",
                              size: SubpingFontSize.body4,
                              color: SubpingColor.black80,
                            ),
                            Space(
                              size: SubpingSize.medium14,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(addresses.length, (index) {
                                    final addressId =
                                        addresses.keys.elementAt(index);

                                    return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              startSubscriveViewModel
                                                  .onSelectAddress(addressId);
                                              Get.back();
                                            },
                                            child: Container(
                                              color: SubpingColor.white100,
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(children: [
                                                        SubpingText(
                                                          addresses[addressId]
                                                              .userName,
                                                          size: SubpingFontSize
                                                              .title6,
                                                        ),
                                                        Space(
                                                          size:
                                                              SubpingSize.tiny5,
                                                        ),
                                                        addresses[addressId]
                                                                .isDefault
                                                            ? Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            2),
                                                                decoration: BoxDecoration(
                                                                    color: SubpingColor
                                                                        .subping30,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                child: SubpingText(
                                                                    "기본배송지",
                                                                    color: SubpingColor
                                                                        .white100,
                                                                    size: SubpingFontSize
                                                                        .tiny1),
                                                              )
                                                            : Container()
                                                      ]),
                                                      Space(
                                                        size: SubpingSize.tiny5,
                                                      ),
                                                      SubpingText(
                                                          "${addresses[addressId].userPhoneNumber}",
                                                          color: SubpingColor
                                                              .black60,
                                                          size: SubpingFontSize
                                                              .body2),
                                                      SubpingText(
                                                        addresses[addressId]
                                                                .address +
                                                            " " +
                                                            addresses[addressId]
                                                                .detailedAddress,
                                                        size: SubpingFontSize
                                                            .body2,
                                                      ),
                                                      Space(
                                                        size: SubpingSize
                                                            .medium10,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () => Get.toNamed(
                                                            "/editAddress/${addresses[addressId].id}",
                                                            preventDuplicates:
                                                                false),
                                                        child: Container(
                                                            child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: SubpingText(
                                                              "수정하기",
                                                              color: SubpingColor
                                                                  .subping100),
                                                        )),
                                                      ),
                                                      Space(
                                                          size: SubpingSize
                                                              .medium10),
                                                      !addresses[addressId]
                                                              .isDefault
                                                          ? GestureDetector(
                                                              onTap: () => Get.toNamed(
                                                                  "/editAddress/${addresses[addressId].id}",
                                                                  preventDuplicates:
                                                                      false),
                                                              child: Container(
                                                                  child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: SubpingText(
                                                                    "삭제하기",
                                                                    color: SubpingColor
                                                                        .black60),
                                                              )),
                                                            )
                                                          : Container()
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider()
                                        ]);
                                  }),
                                  Space(
                                    size: SubpingSize.medium10,
                                  ),
                                  SquareButton(
                                      text: "+ 주소 추가하기",
                                      onPressed: () => Get.toNamed(
                                          "/addAddress",
                                          preventDuplicates: false),
                                      type: "outline")
                                ]),
                            Space(
                              size: SubpingSize.large32,
                            )
                          ]),
                        ),
                      ),
                    )),
                type: "outline"),
            Space(
              size: SubpingSize.medium14,
            ),
          ],
        ),
      ),
    );
  }
}
