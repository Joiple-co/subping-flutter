import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class SubscribePauseIndicator extends StatelessWidget {
  final DateTime lastDate;
  final DateTime nextDate;

  const SubscribePauseIndicator({Key key, this.lastDate, this.nextDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: SubpingColor.subpingAlpha),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.only(right: 21.5),
                child: Image.asset(
                  "assets/icon/coin_indicator.png",
                  width: 36.4,
                  height: 43.7,
                ),
              )
            ]),
            Space(size: SubpingSize.tiny5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: SubpingColor.black80,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: SubpingColor.back20,
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                  Space(size: SubpingSize.medium10),
                  SubpingText(
                      "${(lastDate.month < 10 ? "0" : "") + lastDate.month.toString()}월 ${(lastDate.day < 10 ? "0" : "") + lastDate.day.toString()}일",
                      size: SubpingFontSize.title6),
                  SubpingText("마지막 구독일", size: SubpingFontSize.tiny1),
                ]),
                Column(children: [
                  Column(children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: SubpingColor.black60,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                    Space(size: SubpingSize.medium10),
                    SubpingText(" ", size: SubpingFontSize.title6),
                    SubpingText(" ", size: SubpingFontSize.tiny1),
                  ]),
                ]),
                Column(children: [
                  Column(children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: SubpingColor.black60,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                    Space(size: SubpingSize.medium10),
                    SubpingText(" ", size: SubpingFontSize.title6),
                    SubpingText(" ", size: SubpingFontSize.tiny1),
                  ]),
                ]),
                Column(children: [
                  Column(children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: SubpingColor.black60,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                    Space(size: SubpingSize.medium10),
                    SubpingText(" ", size: SubpingFontSize.title6),
                    SubpingText(" ", size: SubpingFontSize.tiny1),
                  ]),
                ]),
                Column(children: [
                  Column(children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: SubpingColor.subping100,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: SubpingColor.back20,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                    Space(size: SubpingSize.medium10),
                    SubpingText(
                        "${(nextDate.month < 10 ? "0" : "") + nextDate.month.toString()}월 ${(nextDate.day < 10 ? "0" : "") + nextDate.day.toString()}일",
                        size: SubpingFontSize.title6),
                    SubpingText("다음 구독일", size: SubpingFontSize.tiny1),
                  ]),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
