import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/viewmodel/local/main_tabs/my_page/address_viewModel.dart';

class AddAddress extends StatelessWidget {
  final controller = Get.put(AddAddressViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar("주소 추가하기", hasBackButton: true,),
      body: HeaderSafe(
          child: HorizontalPadding(
        child: GetBuilder<AddAddressViewModel>(
            builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      SubpingTextSpan(children: [
                        SubpingTextSpan(
                          text: "구독 상품을 수령 받으실\n",
                          fontSize: SubpingFontSize.title4,
                          fontWeight: SubpingFontWeight.bold,
                        ),
                        SubpingTextSpan(
                          text: "배송지와 정보",
                          fontSize: SubpingFontSize.title4,
                          fontWeight: SubpingFontWeight.bold,
                          color: SubpingColor.subping100,
                        ),
                        SubpingTextSpan(
                            text: "를 입력해 주세요",
                            fontSize: SubpingFontSize.title4,
                            fontWeight: SubpingFontWeight.bold)
                      ]),
                    ),
                    Space(size: SubpingSize.large28),
                    Row(
                      children: [
                        Flexible(
                            flex: 1000,
                            child: GestureDetector(
                              onTap: () {
                                controller.routingKopo(context);
                              },
                              child: Container(
                                height: 110.h,
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
                                height: 110.h,
                                child: SubpingTextField(
                                  controller: controller.zipCodeController,
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
                              height: 110.h,
                              child: SubpingTextField(
                                controller: controller.addressController,
                                readOnly: true,
                                labelText: "배송지",
                              )),
                        )
                      ],
                    ),
                    Space(size: SubpingSize.medium14),
                    Container(
                      height: 110.h,
                      child: SubpingTextField(
                        labelText: "상세 주소",
                        focusNode: controller.detailedAddressFocusNode,
                        onChanged: controller.onChangeDetailAddress,
                        onSubmitted: (String str) {
                          controller.onSubmit();
                        },
                      ),
                    ),
                  ],
                )),
      )),
    );
  }
}