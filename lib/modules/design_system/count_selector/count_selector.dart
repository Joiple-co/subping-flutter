import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class CountSelector extends StatelessWidget {
  final int value;
  final Function onClickPlus;
  final Function onClickMinus;

  const CountSelector(
      {Key key, this.value, this.onClickPlus, this.onClickMinus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onClickMinus,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: SubpingColor.black30),
            child: Icon(Icons.remove, size: SubpingFontSize.title6),
          ),
        ),
        SizedBox(
          width: 40,
          height: 30,
          child: Center(
              child: SubpingText(
            value.toString(),
            color: SubpingColor.subping100,
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.bold,
          )),
        ),
        GestureDetector(
          onTap: onClickPlus,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: SubpingColor.black30),
            child: Icon(
              Icons.add,
              size: SubpingFontSize.title6,
            ),
          ),
        ),
      ],
    );
  }
}
