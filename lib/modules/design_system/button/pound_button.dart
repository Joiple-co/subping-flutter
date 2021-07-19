import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PoundButton extends StatelessWidget {
  final String text;
  final bool marginFlag;

  PoundButton(
    this.text, {
    this.marginFlag,
    String goTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: marginFlag
              ? EdgeInsets.fromLTRB(SubpingSize.tiny10.w, 0, 0, 0)
              : null,
          padding: EdgeInsets.fromLTRB(
              SubpingSize.tiny12.w, 0, SubpingSize.tiny12.w, 0),
          decoration: BoxDecoration(
              color: SubpingColor.back20,
              borderRadius: BorderRadius.circular(2.5)),
          child: Center(
            child: SubpingText(
              '#${this.text}',
              color: SubpingColor.black60,
            ),
          )),
    );
  }
}
