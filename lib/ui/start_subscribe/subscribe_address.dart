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
                          Row(children: [
                            SubpingText(
                              addresses[startSubscriveViewModel.selectedAddress]
                                  .userName,
                              size: SubpingFontSize.body1,
                            ),
                            Space(
                              size: SubpingSize.tiny5,
                            ),
                            addresses[startSubscriveViewModel.selectedAddress]
                                    .isDefault
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: SubpingColor.subping30,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: SubpingText("기본배송지",
                                        color: SubpingColor.white100,
                                        size: SubpingFontSize.tiny1),
                                  )
                                : Container()
                          ]),
                          Space(
                            size: SubpingSize.medium14,
                          ),
                          SubpingText(
                              addresses[startSubscriveViewModel.selectedAddress]
                                  .address,
                              size: SubpingFontSize.body2),
                          SubpingText(
                              addresses[startSubscriveViewModel.selectedAddress]
                                  .detailedAddress,
                              size: SubpingFontSize.body2),
                          Divider(),
                          SubpingText(
                              "전화번호 ${addresses[startSubscriveViewModel.selectedAddress].userPhoneNumber}",
                              size: SubpingFontSize.body2),
                        ],
                      )
                    : Container()),
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
                            Column(children: [
                              ...List.generate(addresses.length, (index) {
                                final addressId =
                                    addresses.keys.elementAt(index);

                                return Column(children: [
                                  GestureDetector(
                                    onTap: () {
                                      startSubscriveViewModel
                                          .onSelectAddress(addressId);
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 2,
                                              color: addressId ==
                                                      startSubscriveViewModel
                                                          .selectedAddress
                                                  ? SubpingColor.subping100
                                                  : SubpingColor.black60)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            SubpingText(
                                              addresses[addressId].userName,
                                              size: SubpingFontSize.body1,
                                            ),
                                            Space(
                                              size: SubpingSize.tiny5,
                                            ),
                                            addresses[addressId].isDefault
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 2),
                                                    decoration: BoxDecoration(
                                                        color: SubpingColor
                                                            .subping30,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: SubpingText("기본배송지",
                                                        color: SubpingColor
                                                            .white100,
                                                        size: SubpingFontSize
                                                            .tiny1),
                                                  )
                                                : Container()
                                          ]),
                                          Space(
                                            size: SubpingSize.medium10,
                                          ),
                                          SubpingText(
                                            addresses[addressId].address,
                                            size: SubpingFontSize.body2,
                                          ),
                                          SubpingText(
                                            addresses[addressId]
                                                .detailedAddress,
                                            size: SubpingFontSize.body2,
                                          ),
                                          Space(
                                            size: SubpingSize.medium10,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SubpingText(
                                                    "전화번호 ${addresses[addressId].userPhoneNumber}",
                                                    size:
                                                        SubpingFontSize.body2),
                                                GestureDetector(
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: SubpingColor
                                                            .black60,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Center(
                                                        child: GestureDetector(
                                                      onTap: () => Get.toNamed(
                                                          "/editAddress/${addresses[addressId].id}",
                                                          preventDuplicates: false),
                                                      child: SubpingText(
                                                        "수정하기",
                                                        color: SubpingColor
                                                            .white100,
                                                      ),
                                                    )),
                                                  ),
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Space(
                                    size: SubpingSize.medium10,
                                  )
                                ]);
                              }),
                              SquareButton(
                                  text: "+ 주소 추가하기",
                                  onPressed: () => Get.toNamed("/addAddress",
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
