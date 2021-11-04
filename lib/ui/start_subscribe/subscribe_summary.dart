import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class SubscribeSummary extends StatelessWidget {
  final StartSubscribeViewModel startSubscribeViewModel;

  const SubscribeSummary({Key key, this.startSubscribeViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Space(
          size: SubpingSize.medium14,
        ),
        SubpingText(
          "구독 요약",
          size: SubpingFontSize.title6,
          fontWeight: SubpingFontWeight.bold,
        ),
        SubpingText(
          "구독 내용을 확인해주세요!",
          size: SubpingFontSize.body4,
          color: SubpingColor.black80,
        ),
        Space(
          size: SubpingSize.medium14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ],
        ),
        Space(
          size: SubpingSize.large20,
        ),
        Space(
          size: SubpingSize.medium14,
        ),
      ],
    );
  }
}
