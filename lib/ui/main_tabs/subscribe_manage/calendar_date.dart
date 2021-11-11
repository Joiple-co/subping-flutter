import 'package:flutter/material.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/subscribe_schedule_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class CalendarDate extends StatelessWidget {
  final DateTime date;
  final List<SubscribeScheduleModel> schedules;
  final bool highlight;
  final Function onClickDate;

  const CalendarDate(
      {Key key,
      this.date,
      this.schedules,
      this.highlight = false,
      this.onClickDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickDate,
      child: Container(
          decoration: BoxDecoration(
              boxShadow: highlight
                  ? [
                      BoxShadow(
                        color: SubpingColor.black30,
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      )
                    ]
                  : [],
              color: highlight ? SubpingColor.white100 : SubpingColor.back20,
              borderRadius: BorderRadius.circular(15)),
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubpingText(weekOfDayToString[date.weekday],
                  size: SubpingFontSize.tiny1, color: SubpingColor.black80),
              SubpingText(date.day.toString(),
                  size: SubpingFontSize.title3, color: SubpingColor.black80),
              Space(
                size: SubpingSize.medium10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(schedules.length, (index) {
                  final schedule = schedules[index];

                  if (schedules.length > 3 && index >= 2) {
                    if (index == 2) {
                      return Row(children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/icon/more.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        Container()
                      ]);
                    } else {
                      return Container();
                    }
                  } else {
                    return Row(children: [
                      ClipOval(
                        child: Image.network(
                          schedule.serviceLogoUrl,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      index < schedules.length - 1
                          ? Space(
                              size: SubpingSize.tiny5,
                            )
                          : Container()
                    ]);
                  }
                }),
              ),
            ],
          )),
    );
  }
}
