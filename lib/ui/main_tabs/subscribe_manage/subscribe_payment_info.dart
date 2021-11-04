import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';

class SubscribePaymentInfo extends StatelessWidget {
  final totalPrice;
  final paidPrice;

  const SubscribePaymentInfo({Key key, this.totalPrice, this.paidPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return HorizontalPadding(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Space(size: SubpingSize.large20),
        SubpingText(
            totalPrice != 0
                ? "${DateTime.now().month}월 총 결제액"
                : "섭핑에서 구독하고\n섭핑에서 관리해요",
            size: SubpingFontSize.title6),
        Space(size: SubpingSize.medium14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubpingText(
              "결제 완료",
              size: SubpingFontSize.body4,
            ),
            SubpingText(
              "지출 총액",
              size: SubpingFontSize.body4,
            ),
          ],
        ),
        Space(
          size: SubpingSize.tiny5,
        ),
        paidPrice != 0
            ? Stack(children: [
                Container(
                  height: 25,
                  width: width - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(180, 215, 255, 0.2),
                  ),
                ),
                Container(
                  height: 25,
                  width: (width - 40) * (paidPrice / totalPrice) < 25
                      ? 25
                      : (width - 40) * (paidPrice / totalPrice),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: SubpingColor.subping100),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: SubpingText(
                                "${((paidPrice / totalPrice) * 100).round()}%",
                                fontWeight: SubpingFontWeight.medium,
                                size: SubpingFontSize.body4,
                                color: SubpingColor.white100))
                      ]),
                ),
              ])
            : Stack(children: [
                Container(
                  height: 25,
                  width: width - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(180, 215, 255, 0.2),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(180, 215, 255, 0.2)),
                ),
              ]),
        Space(
          size: SubpingSize.tiny5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubpingText(
              "${Helper.setComma(paidPrice)}원",
              size: SubpingFontSize.body4,
            ),
            SubpingText(
              "${Helper.setComma(totalPrice)}원",
              size: SubpingFontSize.body4,
            ),
          ],
        ),
        Space(size: SubpingSize.large20),
      ]),
    );
  }
}
