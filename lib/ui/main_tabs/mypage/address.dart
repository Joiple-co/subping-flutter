import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/page/header_padding.dart';
import 'package:subping/ui/design_system/subping_ui.dart';

class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderSafe(
          child: HorizontalPadding(
        child: HeaderPadding(
            child: Column(
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
                  text: "배송지를 ",
                  fontSize: SubpingFontSize.title4,
                  fontWeight: SubpingFontWeight.bold,
                  color: SubpingColor.subping100,
                ),
                SubpingTextSpan(
                    text: "입력해 주세요",
                    fontSize: SubpingFontSize.title4,
                    fontWeight: SubpingFontWeight.bold)
              ]),
            ),
            Space(size: SubpingSize.large56),
            Row(
              children: [],
            )
          ],
        )),
      )),
    );
  }
}
