import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';

const cardHeight = 220.0;
const cardWidth = 200.0;

class ServiceProducts extends StatelessWidget {
  final List<ProductModel> products;

  const ServiceProducts({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 300,
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(
            size: SubpingSize.large20,
          ),
          HorizontalPadding(
              child: SubpingText(
            "구독 가능한 상품",
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.bold,
          )),
          Space(
            size: SubpingSize.medium10,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  products.length,
                  (index) => Row(children: [
                        SizedBox(
                          width: cardWidth,
                          height: cardHeight,
                          child: Column(children: [
                            Container(
                              width: cardWidth,
                              height: cardHeight / 1.8,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        products[index].productLogoUrl)),
                              ),
                            ),
                            Container(
                              width: cardWidth,
                              height: cardHeight - cardHeight / 1.8 - 2,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: SubpingColor.white100,
                                  border: Border.all(
                                      width: 0.5, color: SubpingColor.black60),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SubpingText(
                                        products[index].name,
                                        size: SubpingFontSize.body3,
                                        fontWeight: SubpingFontWeight.bold,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SubpingText(
                                        products[index].summary,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        size: SubpingFontSize.body4,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: cardWidth,
                                    child: SubpingText(
                                      "${Helper.setComma(products[index].price)}원",
                                      textAlign: TextAlign.right,
                                      size: null,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                        Space(
                          size: SubpingSize.medium10,
                        )
                      ])),
            ),
          )
        ],
      ),
    );
  }
}
