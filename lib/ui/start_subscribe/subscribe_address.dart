import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/start_subscribe/select_address.dart';

class SubscribeAddress extends StatelessWidget {
  const SubscribeAddress({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SubpingText("정승우"),
                SubpingText("부산시 수영로 325번길 12"),
                SubpingText("105동 509호")
              ],),
            ),
            Space(
              size: SubpingSize.medium14,
            ),
            SquareButton(text: "주소 변경하기", onPressed: () => Get.to(SelectAddress()), type: "outline"),
          ],
        ),
    );
  }
}