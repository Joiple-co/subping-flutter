import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../settingTable.dart';

class SqaureButton extends StatelessWidget {
  final String text;
  final String type;
  final bool twoButton;
  final Function onPressed;
  @protected
  final double width;
  @protected
  final double height;
  final bool disabled;
  final bool loading;
  final bool warning;

  SqaureButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.type = "inline",
      this.twoButton = false,
      this.width,
      this.height = 110,
      this.loading = false,
      this.warning = false,
      this.disabled = false})
      : super(key: key);

  Color _setTextColor() {
    if (this.type == "outline") {
      if (this.disabled) {
        return SubpingColor.black60;
      } else {
        return SubpingColor.subping100;
      }
    } else {
      if (this.disabled) {
        return SubpingColor.black80;
      } else {
        return SubpingColor.white100;
      }
    }
  }

  Color _setBackColor() {
    if (this.type == "outline") {
      if (this.disabled) {
        return SubpingColor.black60;
      } else {
        return SubpingColor.white100;
      }
    } else {
      if (this.disabled) {
        return SubpingColor.black80;
      } else {
        if (this.warning) {
          return SubpingColor.warning100;
        }
        return SubpingColor.subping100;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double indicatorSize = height.h - height.h / 2;
    double buttonWidth = this.twoButton
        ? (MediaQuery.of(context).size.width - 40) / 2 - 17.5
        : MediaQuery.of(context).size.width - 40;

    return TextButton(
      child: loading
          ? Container(
              height: indicatorSize,
              width: indicatorSize,
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).indicatorColor),
              ),
            )
          : Text(this.text,
              style: TextStyle(
                  color: _setTextColor(),
                  fontWeight: FontWeight.bold,
                  fontSize: 34.nsp)),
      onPressed: disabled || loading ? null : onPressed,
      style: TextButton.styleFrom(
          side: this.type == "outline"
              ? BorderSide(
                  width: 1,
                  color: SubpingColor.subping100,
                )
              : null,
          minimumSize: Size(buttonWidth, this.height.h),
          backgroundColor: _setBackColor()),
    );
  }
}
