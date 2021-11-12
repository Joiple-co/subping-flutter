import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/appbar/title_appbar.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class SelectProduct extends StatelessWidget {
  const SelectProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startSubscribeViewModel = Get.find<StartSubscribeViewModel>();
    final products = startSubscribeViewModel.products.values;

    return Scaffold(
        appBar: const TitleAppBar(
          "상품 선택하기",
          hasBackButton: true,
        ),
        body: Obx(
          () => HeaderSafe(
            child: Container(
                color: SubpingColor.white100,
                child: HorizontalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: '구독하고 싶은 ',
                            fontSize: SubpingFontSize.title4,
                            fontWeight: SubpingFontWeight.bold),
                        SubpingTextSpan(
                            text: '상품',
                            fontSize: SubpingFontSize.title4,
                            fontWeight: SubpingFontWeight.bold,
                            color: SubpingColor.subping100),
                        SubpingTextSpan(
                            text: '을\n선택해주세요 😀',
                            fontSize: SubpingFontSize.title4,
                            fontWeight: SubpingFontWeight.bold),
                      ])),
                      SubpingText("상품 로고를 누르면,\n상품에 대한 자세한 정보를 볼 수 있어요!",
                          size: SubpingFontSize.body1),
                      Space(
                        size: SubpingSize.large20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(products.length, (index) {
                              final selectedProduct = startSubscribeViewModel
                                  .selectedProducts.keys
                                  .elementAt(0);
                              final product = products.elementAt(index);

                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => startSubscribeViewModel
                                        .onSelectProduct(product.id, 1,
                                            customizable: false),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color:
                                                  product.id == selectedProduct
                                                      ? SubpingColor.subping100
                                                      : SubpingColor.black60),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 75,
                                            height: 75,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      product.productLogoUrl)),
                                            ),
                                          ),
                                          Space(
                                            size: SubpingSize.medium14,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SubpingText(product.name,
                                                    size:
                                                        SubpingFontSize.body1),
                                                SubpingText(
                                                  product.summary,
                                                  size: null,
                                                ),
                                                SubpingText(
                                                  "${Helper.setComma(product.price)}원",
                                                  color:
                                                      SubpingColor.subping100,
                                                  fontWeight: FontWeight.bold,
                                                  size: null,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Space(
                                    size: SubpingSize.medium14,
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      SquareButton(text: "완료", onPressed: () => Get.back()),
                      Space(size: SubpingSize.large20)
                    ],
                  ),
                )),
          ),
        ));
  }
}
