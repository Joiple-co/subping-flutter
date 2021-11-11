import 'package:flutter/material.dart';

import '../setting_table.dart';

class MiniSquareButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool disabled;
  final bool warning;

  const MiniSquareButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.warning = false,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.5),
        alignment: Alignment.center,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: warning ? const Color.fromRGBO(248, 60, 90, 0.15) : Color.fromRGBO(180, 209, 255, 0.3)),
        child: Text(text,
            style: TextStyle(
                color: warning ? SubpingColor.warning100 : SubpingColor.subping100,
                fontWeight: SubpingFontWeight.regular,
                fontSize: SubpingFontSize.body3)),
      ),
    );
  }
}
