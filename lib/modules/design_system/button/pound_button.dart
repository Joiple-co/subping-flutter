import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PoundButton extends StatelessWidget {
  final String text;
  final bool marginFlag;
  final String clickTo;

  PoundButton(
    this.text, {
    this.marginFlag,
    this.clickTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: marginFlag
              ? EdgeInsets.fromLTRB(SubpingSize.tiny6, 0, 0, 0)
              : null,
          padding:
              EdgeInsets.fromLTRB(SubpingSize.tiny6, 0, SubpingSize.tiny6, 0),
          decoration: BoxDecoration(
              color: SubpingColor.back20,
              borderRadius: BorderRadius.circular(2.5)),
          child: Center(
            child: SubpingText(
              '${this.text}',
              size: SubpingFontSize.body4,
              color: SubpingColor.black60,
            ),
          )),
    );
  }
}
