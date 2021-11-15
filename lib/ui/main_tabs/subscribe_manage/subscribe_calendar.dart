import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:subping/modules/design_system/loading/subping_loading.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/calendar_date.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_calendar_empty.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/timeline_status.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewmodel.dart';

class SubscribeCalendar extends StatelessWidget {
  const SubscribeCalendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscribeViewModel = Get.find<SubscribeViewModel>();
    final subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

    return Obx(() {
      final schedules = subscribeManageViewModel
          .schedules[subscribeManageViewModel.focusedMonth];

      if (subscribeViewModel.subscribe.keys.isEmpty) {
        return Container(
            color: SubpingColor.white100,
            child: const SubscribeCalendarEmpty());
      }

      if (schedules == null) {
        return Container(
            color: SubpingColor.white100, child: const SubpingLoading());
      }

      final sortedDates = schedules.keys.toList()..sort();

      return Container(
        color: SubpingColor.white100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10,
              color: SubpingColor.back20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: subscribeManageViewModel.toggleFocusedMonth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Space(size: SubpingSize.medium14),
                          Row(children: [
                            SubpingText(
                              "${subscribeManageViewModel.focusedMonth}월 구독 리스트",
                              size: SubpingFontSize.title6,
                            ),
                            Space(
                              size: SubpingSize.tiny5,
                            ),
                            Icon(Icons.change_circle_rounded,
                                color: SubpingColor.black60,
                                size: SubpingFontSize.title2)
                          ]),
                          Space(size: SubpingSize.medium14),
                        ],
                      ),
                    ),
                  ),
                  sortedDates.isNotEmpty
                      ? SizedBox(
                          height: 140,
                          child: ListView(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10),
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children:
                                  List.generate(sortedDates.length, (index) {
                                final date = sortedDates[index];
                                final schedulesOfDate = schedules[date];

                                return Row(children: [
                                  CalendarDate(
                                      highlight: subscribeManageViewModel
                                              .highlightIndex ==
                                          index,
                                      date: DateTime.parse(date),
                                      schedules: schedulesOfDate,
                                      onClickDate: () =>
                                          subscribeManageViewModel
                                              .jumpToIndex(index)),
                                  Space(
                                    size: SubpingSize.medium14,
                                  )
                                ]);
                              })))
                      : SizedBox(
                          height: 140,
                          child: ListView(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10),
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(children: [
                                  const CalendarDate(empty: true),
                                  Space(
                                    size: SubpingSize.medium14,
                                  )
                                ])
                              ])),
                  Space(size: SubpingSize.medium14),
                  Expanded(
                    child: sortedDates.isNotEmpty
                        ? Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: ScrollablePositionedList.builder(
                              padding: const EdgeInsets.only(top: 10),
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: sortedDates.length,
                              itemBuilder: (context, index) {
                                final date = sortedDates[index];
                                final schedulesOfDate = schedules[date];

                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: SubpingText(
                                          "${DateTime.parse(date).day}일",
                                          size: SubpingFontSize.title5,
                                          fontWeight: SubpingFontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            schedulesOfDate.length, (index) {
                                          final schedule =
                                              schedulesOfDate[index];

                                          return Column(children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: SubpingColor.back20,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          ClipOval(
                                                            child:
                                                                Image.network(
                                                              schedule
                                                                  .serviceLogoUrl,
                                                              width: 25,
                                                              height: 25,
                                                            ),
                                                          ),
                                                          Space(
                                                              size: SubpingSize
                                                                  .tiny5),
                                                          SubpingText(
                                                              schedule
                                                                  .serviceName,
                                                              size:
                                                                  SubpingFontSize
                                                                      .title6)
                                                        ],
                                                      ),
                                                      TimeLineStatus(
                                                        status: schedule.status,
                                                      )
                                                    ],
                                                  ),
                                                  Space(
                                                      size:
                                                          SubpingSize.medium14),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                schedule
                                                                    .productName
                                                                    .length,
                                                                (index) {
                                                              return Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        SubpingText(
                                                                      "${schedule.productName[index]}",
                                                                      size: SubpingFontSize
                                                                          .body1,
                                                                      color: SubpingColor
                                                                          .black80,
                                                                    ),
                                                                  ),
                                                                  Space(
                                                                    size: SubpingSize
                                                                        .large20,
                                                                  ),
                                                                  Container(
                                                                      width: 2,
                                                                      height:
                                                                          25,
                                                                      color: SubpingColor
                                                                          .black30),
                                                                  Space(
                                                                    size: SubpingSize
                                                                        .large20,
                                                                  )
                                                                ],
                                                              );
                                                            })),
                                                      ),
                                                      schedule.totalPrice !=
                                                              null
                                                          ? SubpingText(
                                                              "${Helper.setComma(schedule.totalPrice)}원",
                                                              size:
                                                                  SubpingFontSize
                                                                      .body1,
                                                              fontWeight:
                                                                  SubpingFontWeight
                                                                      .bold,
                                                            )
                                                          : Container()
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Space(
                                              size: SubpingSize.medium10,
                                            )
                                          ]);
                                        }),
                                      ),
                                    )
                                  ],
                                );
                              },
                              itemScrollController:
                                  subscribeManageViewModel.itemScrollController,
                              itemPositionsListener: subscribeManageViewModel
                                  .itemPositionsListener,
                            ),
                          )
                        : Column(
                            children: [
                              Space(
                                size: SubpingSize.medium10,
                              ),
                              HorizontalPadding(
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 33),
                                  decoration: BoxDecoration(
                                      color: SubpingColor.back20,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SubpingText(
                                      "${subscribeManageViewModel.focusedMonth}월엔 구독 상품이 없어요 😢",
                                      size: SubpingFontSize.body1,
                                      color: SubpingColor.black80,
                                      fontWeight: SubpingFontWeight.medium,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                  )
                ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: subscribeManageViewModel
                    .itemPositionsListener.itemPositions,
                builder: (context, positions, child) {
                  if (positions.isNotEmpty) {
                    num minIndex = positions
                        .where((ItemPosition position) =>
                            position.itemTrailingEdge > 0)
                        .reduce((ItemPosition min, ItemPosition position) =>
                            position.itemTrailingEdge <= min.itemTrailingEdge
                                ? position
                                : min)
                        .index;
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      subscribeManageViewModel.onChangeMinIndex(minIndex);
                    });
                  }
                  return const SizedBox.shrink();
                }),
          ],
        ),
      );
    });
  }
}
