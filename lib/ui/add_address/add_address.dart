import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'package:subping/viewmodel/local/add_address/add_address_viewmodel.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressViewModel = Get.put(AddAddressViewModel());
    final userViewModel = Get.find<UserViewModel>();

    addressViewModel.setUserDefaultInfo(
        userViewModel.name, userViewModel.phoneNumber);

    return Obx(
      () => Scaffold(
          backgroundColor: SubpingColor.white100,
          resizeToAvoidBottomInset: false,
          appBar: TitleAppBar(
            "주소 추가하기",
            hasBackButton: true,
          ),
          body: HeaderSafe(
            child: HorizontalPadding(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Space(size: SubpingSize.tiny7),
                    SubpingTextField(
                      controller: addressViewModel.userNameController,
                      labelText: "배송받는 분",
                      maxLines: 1,
                      onChanged: (_) => addressViewModel.checkValid(),
                    ),
                    Space(size: SubpingSize.medium14),
                    SubpingTextField(
                      controller: addressViewModel.phoneNumberController,
                      labelText: "전화번호",
                      maxLines: 1,
                      inputFormatters: [addressViewModel.phoneNumberFormatter],
                      onChanged: (_) => addressViewModel.checkValid(),
                    ),
                    Space(size: SubpingSize.medium14),
                    Row(
                      children: [
                        Flexible(
                            flex: 1000,
                            child: GestureDetector(
                              onTap: () {
                                addressViewModel.routingKopo(context);
                              },
                              child: Container(
                                height: 55,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: SubpingColor.subping100,
                                    borderRadius: BorderRadius.circular(4)),
                                child: SubpingText(
                                  "주소 찾기",
                                  fontWeight: SubpingFontWeight.regular,
                                  size: SubpingFontSize.body2,
                                  color: SubpingColor.white100,
                                ),
                              ),
                            )),
                        Space(size: SubpingSize.tiny7),
                        Flexible(
                            flex: 2529,
                            child: Container(
                                child: SubpingTextField(
                              controller: addressViewModel.zipCodeController,
                              labelText: "우편 번호",
                              readOnly: true,
                            ))),
                      ],
                    ),
                    Space(size: SubpingSize.medium14),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                              child: SubpingTextField(
                            controller: addressViewModel.addressController,
                            readOnly: true,
                            labelText: "배송지",
                          )),
                        )
                      ],
                    ),
                    Space(size: SubpingSize.medium14),
                    Container(
                      child: SubpingTextField(
                        labelText: "상세 주소",
                        maxLines: 1,
                        focusNode: addressViewModel.detailedAddressFocusNode,
                        onChanged: addressViewModel.onChangeDetailAddress,
                        onSubmitted: (String str) {
                          if(addressViewModel.isValid.value) {
                            addressViewModel.onSubmit();
                          }
                        },
                      ),
                    ),
                    Row(children: [
                      Checkbox(
                          activeColor: SubpingColor.subping100,
                          value: addressViewModel.isDefault.value,
                          onChanged: addressViewModel.onClickIsDefault),
                      SubpingText("기본 주소로 사용할래요!", size: SubpingFontSize.body1)
                    ])
                  ]),
                  Column(
                    children: [
                      SquareButton(
                        text: "주소 추가하기", 
                        onPressed: addressViewModel.onSubmit, 
                        disabled: !addressViewModel.isValid.value,
                        loading: addressViewModel.loading.value),
                      Space(
                        size: SubpingSize.large20,
                      )
                    ],
                  )
                ])),
          )),
    );
  }
}
