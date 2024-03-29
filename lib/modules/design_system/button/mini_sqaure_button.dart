import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

import '../setting_table.dart';

class MiniSquareButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool disabled;
  final bool warning;
  final bool loading;

  const MiniSquareButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.warning = false,
      this.loading = false,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled || loading ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.5),
        alignment: Alignment.center,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: disabled
                ? SubpingColor.black30
                : warning
                    ? const Color.fromRGBO(248, 60, 90, 0.15)
                    : const Color.fromRGBO(180, 209, 255, 0.3)),
        child: loading
            ? Row(children: [
                Text(text,
                    style: TextStyle(
                        color: disabled
                            ? SubpingColor.black80
                            : warning
                                ? SubpingColor.warning100
                                : SubpingColor.subping100,
                        fontWeight: SubpingFontWeight.regular,
                        fontSize: SubpingFontSize.body3)),
                Space(size: SubpingSize.medium8),
                SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                        Theme.of(context).indicatorColor),
                  ),
                ),
              ])
            : Text(text,
                style: TextStyle(
                    color: disabled
                        ? SubpingColor.black80
                        : warning
                            ? SubpingColor.warning100
                            : SubpingColor.subping100,
                    fontWeight: SubpingFontWeight.regular,
                    fontSize: SubpingFontSize.body3)),
      ),
    );
  }
}
