import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/ui/start_subscribe/select_product.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class SubscribeItem extends StatelessWidget {
  final StartSubscribeViewModel startSubscribeViewModel;
  final bool customizable;

  const SubscribeItem(
      {Key key, this.startSubscribeViewModel, this.customizable});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(
            size: SubpingSize.medium14,
          ),
          SubpingText(
            customizable ? "상품 구성" : "상품",
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.bold,
          ),
          SubpingText(
            customizable ? "구성은 구독 이후에도 변경이 가능해요!" : "상품은 구독 이후에도 변경이 가능해요!",
            size: SubpingFontSize.body4,
            color: SubpingColor.black80,
          ),
          Space(
            size: SubpingSize.medium14,
          ),
          Column(
              children: List.generate(
                  startSubscribeViewModel.selectedProducts.length, (index) {
            final productId =
                startSubscribeViewModel.selectedProducts.keys.elementAt(index);
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
                            SubpingText(product.name,
                                size: SubpingFontSize.body1),
                            SubpingText(
                              "${Helper.setComma(product.price)}원",
                              color: SubpingColor.subping100,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SubpingText(
                          product.summary,
                          size: SubpingFontSize.body5,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              customizable
                  ? Space(
                      size: SubpingSize.medium14,
                    )
                  : Container()
            ]);
          })),
          customizable
              ? Divider(
                  color: SubpingColor.black80,
                )
              : Container(),
          customizable
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubpingText("합계"),
                    SubpingText(
                        "${Helper.setComma(startSubscribeViewModel.getSelectedTotalAmount())}원")
                  ],
                )
              : Container(),
          Space(
            size: SubpingSize.large20,
          ),
          SquareButton(
                text: customizable ? "구성 변경하기" : "상품 변겅하기",
                onPressed: () => Get.to(SelectProduct()),
                type: "outline"),
          Space(
            size: SubpingSize.medium14,
          ),
        ],
      ),
    );
  }
}
