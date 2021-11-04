import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class TimeLineStatus extends StatelessWidget {
  final String status;

  const TimeLineStatus({Key key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorMapper = {
      "결제 완료": {"back": SubpingColor.black30, "text": SubpingColor.black60},
      "결제 예정": {"back": SubpingColor.subping100, "text": SubpingColor.white100},
      "결제 실패": {"back": SubpingColor.warning100, "text": SubpingColor.white100},
    };

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 5),
      decoration: BoxDecoration(
          color: ColorMapper[status] != null
              ? ColorMapper[status]['back']
              : SubpingColor.subping100,
          borderRadius: BorderRadius.circular(5)),
      child: SubpingText(
        status,
        size: SubpingFontSize.body5,
        color: ColorMapper[status] != null
            ? ColorMapper[status]['text']
            : SubpingColor.white100,
      ),
    );
  }
}
