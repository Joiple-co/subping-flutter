import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/appbar/title_appbar.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/viewmodel/global/product_viewmodel.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/local/subsctibe_detail_manage/subscribe_detail_manage_viewmodel.dart';

class SubscribeManageSelectProduct extends StatelessWidget {
  final String serviceId;
  final String subscribeId;

  const SubscribeManageSelectProduct(
      {Key key, this.serviceId, this.subscribeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscribeDetailManageViewModel =
        Get.find<SubscribeDetailManageViewModel>();
    final subscribeViewModel = Get.find<SubscribeViewModel>();
    final productViewModel = Get.find<ProductViewModel>();

    final subscribe = subscribeViewModel.subscribe[serviceId];
    productViewModel.updateProducts(serviceId);
    subscribeDetailManageViewModel
        .initSelectedProducts(subscribe.subscribeItems);

    return Scaffold(
        appBar: const TitleAppBar(
          "구독 변경하기",
          hasBackButton: true,
        ),
        body: Obx(() {
          final products = productViewModel.products[serviceId] ?? [];

          return HeaderSafe(
            child: Container(
                color: SubpingColor.white100,
                child: HorizontalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: '변경할 ',
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
                          child: products.isNotEmpty
                              ? Column(
                                  children:
                                      List.generate(products.length, (index) {
                                    final selectedProduct =
                                        subscribeDetailManageViewModel
                                            .selectedProducts.keys
                                            .elementAt(0);
                                    final product = products.elementAt(index);

                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              subscribeDetailManageViewModel
                                                  .onSelectProduct(
                                                      product.id, 1,
                                                      customizable: false),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: product.id ==
                                                            selectedProduct
                                                        ? SubpingColor
                                                            .subping100
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
                                                        BorderRadius.circular(
                                                            8),
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            product
                                                                .productLogoUrl)),
                                                  ),
                                                ),
                                                Space(
                                                  size: SubpingSize.medium14,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SubpingText(product.name,
                                                          size: SubpingFontSize
                                                              .body1),
                                                      SubpingText(
                                                        product.summary,
                                                        size: null,
                                                      ),
                                                      SubpingText(
                                                        "${Helper.setComma(product.price)}원",
                                                        color: SubpingColor
                                                            .subping100,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                )
                              : const Expanded(child: SubpingLoading()),
                        ),
                      ),
                      SquareButton(
                          text: "완료",
                          loading: subscribeDetailManageViewModel
                              .isSubscribeItemUpdateLoading,
                          disabled:
                              !subscribeDetailManageViewModel.isChangedProduct,
                          onPressed: () async {
                            await subscribeDetailManageViewModel
                                .updateSubscribeItems(serviceId, subscribeId);
                          }),
                      Space(size: SubpingSize.large20)
                    ],
                  ),
                )),
          );
        }));
  }
}
