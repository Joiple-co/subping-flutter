import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';

const CARD_HEIGHT = 220.0;
const CARD_WIDTH = 200.0;

class ServiceProducts extends StatelessWidget {
  List<ProductModel> products;

  ServiceProducts({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 300,
      padding: EdgeInsets.only(bottom: 10),
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
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  products.length,
                  (index) => Row(children: [
                        Container(
                          width: CARD_WIDTH,
                          height: CARD_HEIGHT,
                          child: Column(children: [
                            Container(
                              width: CARD_WIDTH,
                              height: CARD_HEIGHT / 1.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        products[index].productLogoUrl)),
                              ),
                            ),
                            Container(
                              width: CARD_WIDTH,
                              height: CARD_HEIGHT - CARD_HEIGHT / 1.8 - 2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: SubpingColor.white100,
                                  border: Border.all(
                                      width: 0.5, color: SubpingColor.black60),
                                  borderRadius: BorderRadius.only(
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
                                  Container(
                                    width: CARD_WIDTH,
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
