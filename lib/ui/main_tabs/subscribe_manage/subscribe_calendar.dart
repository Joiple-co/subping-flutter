import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_block.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe/subscribe_manage_viewModel.dart';
import 'package:table_calendar/table_calendar.dart';

class SubscribeCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<SubscribeManageViewModel>(
      builder: (viewModel) => Container(
        margin: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
        child: Column(children: [
          Container(
              decoration: BoxDecoration(
                  color: SubpingColor.white100,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  TableCalendar(
                    key: PageStorageKey("subscribe_calendar_table_calendar"),
                    calendarFormat: viewModel.format.value,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarBuilders: CalendarBuilders(
                      headerTitleBuilder: (context, day) {
                        return Center(
                            child: SubpingText(
                          '${day.month}월',
                          fontWeight: SubpingFontWeight.bold,
                        ));
                      },
                      dowBuilder: (context, day) {
                        List<Map<String, dynamic>> date = [
                          {"day": "일", "color": SubpingColor.warning100},
                          {"day": "월", "color": SubpingColor.black100},
                          {"day": "화", "color": SubpingColor.black100},
                          {"day": "수", "color": SubpingColor.black100},
                          {"day": "목", "color": SubpingColor.black100},
                          {"day": "금", "color": SubpingColor.black100},
                          {"day": "토", "color": SubpingColor.subping100},
                        ];

                        return Center(
                          child: SubpingText(date[day.weekday - 1]["day"],
                              size: SubpingFontSize.body5,
                              color: date[day.weekday - 1]["color"]),
                        );
                      },
                      todayBuilder: (context, day, _) {
                        return Center(child: SubpingText('${day.day}'));
                      },
                    ),
                    headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        headerPadding: EdgeInsets.fromLTRB(0, 0, 0, 10.h)),
                    firstDay: viewModel.startDate.value,
                    lastDay: viewModel.endDate.value,
                    focusedDay: viewModel.focusedDate.value,
                    onDaySelected: viewModel.onDaySelected,
                    onFormatChanged: viewModel.onFormatChanged,
                    onHeaderTapped: viewModel.onHeaderTapped,
                    selectedDayPredicate: viewModel.selectedDayPredicate,
                    availableGestures: AvailableGestures.all,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                      CalendarFormat.week: 'Week',
                    },
                  ),
                  Space(size: SubpingSize.tiny10),
                  Container(
                    height: 5,
                    color: SubpingColor.white100,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: SubpingColor.black30),
                      width: 50,
                    ),
                  ),
                  Space(size: SubpingSize.tiny10)
                ],
              )),
          Expanded(
              child: HorizontalPadding(
            child: ScrollablePositionedList.builder(
              key: PageStorageKey("subscribe_calendar_list"),
              initialScrollIndex:
                  viewModel.calcIndex(viewModel.focusedDate.value),
              itemScrollController: viewModel.itemScrollController,
              itemPositionsListener: viewModel.itemPositionsListener,
              itemBuilder: (context, index) {
                final dateOfIndex =
                    viewModel.startDate.value.add(Duration(days: index));
                final dateFormatter = DateFormat("yyyy년 MM월 dd일");
                List<String> date = ["월", "화", "수", "목", "금", "토", "일"];

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (dateOfIndex.day == 1)
                            Container(
                                margin: EdgeInsets.only(
                                    bottom: SubpingSize.medium20),
                                child: SubpingText(
                                  '${dateOfIndex.month}월',
                                  size: SubpingFontSize.title5,
                                  fontWeight: SubpingFontWeight.bold,
                                )),
                          SubpingText(
                            '${dateFormatter.format(dateOfIndex)} ${date[dateOfIndex.weekday - 1]}요일',
                            size: SubpingFontSize.body4,
                            fontWeight: SubpingFontWeight.bold,
                            color: SubpingColor.subping100,
                          )
                        ],
                      ),
                      SubscribeBlock()
                    ]);
              },
              itemCount: viewModel.endDate.value
                      .difference(viewModel.startDate.value)
                      .inDays +
                  1,
            ),
          )),
          ValueListenableBuilder(
              valueListenable: viewModel.itemPositionsListener.itemPositions,
              builder: (context, positions, child) {
                if (positions.isNotEmpty) {
                  num minIndex = positions
                      .where((ItemPosition position) =>
                          position.itemTrailingEdge > 0)
                      .reduce((ItemPosition min, ItemPosition position) =>
                          position.itemTrailingEdge < min.itemTrailingEdge
                              ? position
                              : min)
                      .index;

                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    viewModel.onChangeViewItem(minIndex);
                  });
                }
                return SizedBox.shrink();
              })
        ]),
      ),
    );
  }
}
