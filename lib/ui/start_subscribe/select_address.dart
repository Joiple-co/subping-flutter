import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SubpingColor.white100,
      appBar: TitleAppBar("배송지 선택하기", hasBackButton: true,),
      body: HorizontalPadding(
        child: Column(
          children: [
            SquareButton(text: "주소 추가하기", onPressed: () => Get.toNamed("/addAddress"), type: "outline")
          ]
        ),
      ),
    );
  }
}