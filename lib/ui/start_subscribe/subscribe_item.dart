import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/ui/start_subscribe/customize_product.dart';
import 'package:subping/ui/start_subscribe/select_product.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class SubscribeItem extends StatelessWidget {
  final StartSubscribeViewModel startSubscribeViewModel;
  final bool customizable;

  const SubscribeItem(
      {Key key, this.startSubscribeViewModel, this.customizable});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(
            size: SubpingSize.medium14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(SubpingTextSpan(children: [
                SubpingTextSpan(
                  text: customizable ? "상품 구성 " : "상품",
                  fontSize: SubpingFontSize.title6,
                  fontWeight: SubpingFontWeight.bold,
                ),
                customizable
                    ? SubpingTextSpan(
                        text:
                            "${startSubscribeViewModel.getSelectedTotalCount()}건",
                        fontSize: SubpingFontSize.title6,
                        fontWeight: SubpingFontWeight.bold,
                        color: SubpingColor.subping100)
                    : SubpingTextSpan()
              ])),
            ],
          ),
          SubpingText(
            customizable ? "구성은 구독 이후에도 변경이 가능해요!" : "상품은 구독 이후에도 변경이 가능해요!",
            size: SubpingFontSize.body4,
            color: SubpingColor.black80,
          ),
          Space(
            size: SubpingSize.medium14,
          ),
          Container(
            decoration: BoxDecoration(
                color: SubpingColor.back20,
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Column(
                children: List.generate(
                    startSubscribeViewModel.selectedProducts.length, (index) {
              final productId = startSubscribeViewModel.selectedProducts.keys
                  .elementAt(index);
              final product = startSubscribeViewModel.products[productId];

              return Column(children: [
                Row(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(product.productLogoUrl)))),
                    Space(size: SubpingSize.large15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SubpingText(product.name,
                                    size: SubpingFontSize.body1),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SubpingText(
                                "${Helper.setComma(product.price)}원",
                                color: SubpingColor.black80,
                                fontWeight: FontWeight.bold,
                              ),
                              customizable
                                  ? SubpingText(
                                      " | ",
                                      color: SubpingColor.black30,
                                    )
                                  : Container(),
                              customizable
                                  ? SubpingText(
                                      "${startSubscribeViewModel.selectedProducts[productId]}개",
                                      color: SubpingColor.black80)
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                startSubscribeViewModel.selectedProducts.length - 1 != index
                    ? Space(
                        size: SubpingSize.medium10,
                      )
                    : Container()
              ]);
            })),
          ),
          customizable
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Space(
                      size: SubpingSize.medium10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          "assets/icon/coin.png",
                        ),
                      ),
                      Space(
                        size: SubpingSize.tiny5,
                      ),
                      SubpingText(
                        "총 구독 금액",
                        color: SubpingColor.black60,
                        size: SubpingFontSize.body1,
                      ),
                    ]),
                    SubpingText(
                      "${Helper.setComma(startSubscribeViewModel.getSelectedTotalAmount())}원",
                      size: SubpingFontSize.title5,
                      fontWeight: SubpingFontWeight.bold,
                    )
                  ],
                )
              : Container(),
          Space(
            size: SubpingSize.large20,
          ),
          SquareButton(
              text: customizable ? "구성 변경하기" : "상품 변경하기",
              onPressed: customizable
                  ? () => Get.to(CustomizeProduct())
                  : () => Get.to(SelectProduct()),
              type: "outline"),
          Space(
            size: SubpingSize.medium14,
          ),
        ],
      ),
    );
  }
}
