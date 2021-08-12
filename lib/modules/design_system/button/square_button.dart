import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../setting_table.dart';

class SquareButton extends StatelessWidget {
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

  SquareButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.type = "inline",
      this.twoButton = false,
      this.width,
      this.height = 55,
      this.loading = false,
      this.warning = false,
      this.disabled = false})
      : super(key: key);

  Color _setTextColor() {
    //Button Type에 따라 Text Color 변경
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
    ////Button Type에 따라 Background Color 변경
    if (this.type == "outline") {
      if (this.disabled) {
        return SubpingColor.black60;
      } else {
        return SubpingColor.white100;
      }
    } else {
      if (this.disabled) {
        return SubpingColor.black30;
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
    double indicatorSize = height - height / 2;
    double buttonWidth = this.twoButton
        ? (MediaQuery.of(context).size.width - 50) / 2
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
                  fontSize: 17)),
      onPressed: disabled || loading ? null : onPressed,
      style: TextButton.styleFrom(
          side: this.type == "outline"
              ? BorderSide(
                  width: 1,
                  color: SubpingColor.subping100,
                )
              : null,
          minimumSize: Size(buttonWidth, this.height),
          backgroundColor: _setBackColor()),
    );
  }
}
