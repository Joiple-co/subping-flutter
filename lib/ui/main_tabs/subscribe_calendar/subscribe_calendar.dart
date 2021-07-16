import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/main_tabs/subscribe_calendar/subscribe_calendar_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';

class SubscribeCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(SubscribeCalendarViewModel());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.jumpTo(viewModel.calcIndex(viewModel.currentDate.value));
    });

    return GetX<SubscribeCalendarViewModel>(
      builder: (viewModel) => HeaderSafe(
          hasBottomSafe: false,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: SubpingColor.white100,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.pin,
              ),
              centerTitle: false,
              title: SubpingText("구독 캘린더",
                  color: SubpingColor.black100,
                  fontWeight: SubpingFontWeight.bold,
                  size: SubpingFontSize.title5),
              leadingWidth: 0.w,
              elevation: 0,
            ),
            body: Column(children: [
              TableCalendar(
                calendarFormat: viewModel.format.value,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarBuilders:
                    CalendarBuilders(headerTitleBuilder: (context, day) {
                  return Center(
                      child: SubpingText(
                    '${day.month}월',
                    fontWeight: SubpingFontWeight.bold,
                  ));
                }, dowBuilder: (context, day) {
                  List<String> date = ["월", "화", "수", "목", "금", "토", "일"];

                  return Center(
                    child: SubpingText(date[day.weekday - 1]),
                  );
                },
                todayBuilder: (context, day, _) {
                  return Center(child: SubpingText('${day.day}'));
                },
                // selectedBuilder: (context, day, _) {
                //   return Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Center(child: 
                //         SubpingText("${day.day}")
                //       ,),
                //       SizedBox(
                //         height: 10.h,
                //         child: Container(
                //           color: SubpingColor.subping100
                //         ),
                //       )
                //     ],
                //   );
                // }
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
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemScrollController: viewModel.itemScrollController,
                  itemPositionsListener: viewModel.itemPositionsListener,
                  itemBuilder: (context, index) {
                    final dateOfIndex =
                        viewModel.startDate.value.add(Duration(days: index));
                    final dateFormatter = DateFormat("yyyy년 MM월 dd일");
                    List<String> date = ["월", "화", "수", "목", "금", "토", "일"];

                    return StickyHeader(
                        header: Center(
                          child: SubpingText(
                              '${dateFormatter.format(dateOfIndex)} ${date[dateOfIndex.weekday - 1]}요일'),
                        ),
                        content: SizedBox(
                          height: 100,
                        ));
                  },
                  itemCount: viewModel.endDate.value
                          .difference(viewModel.startDate.value)
                          .inDays +
                      1,
                ),
              ),
              ValueListenableBuilder(
                  valueListenable:
                      viewModel.itemPositionsListener.itemPositions,
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
          )),
    );
  }
}
