import 'package:flutter/material.dart';
import 'package:subping/const/const.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class PeriodRadioSelector extends StatelessWidget {
  final List<Period> period;
  final Period value;
  final Function onChangeValue;

  const PeriodRadioSelector(
      {Key key, this.period, this.value, this.onChangeValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          period.length,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubpingText(PeriodString[period[index]], size: SubpingFontSize.title6,),
                  Radio(
                      value: period[index],
                      groupValue: value,
                      onChanged: (value) => onChangeValue(value))
                ],
              )),
    );
  }
}
