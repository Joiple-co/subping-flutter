import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:table_calendar/table_calendar.dart';

class SubscribeManageViewModel extends GetxController{
  Rx<DateTime> currentDate = DateTime.now().obs;
  Rx<DateTime> focusedDate = DateTime.now().obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<CalendarFormat> format = CalendarFormat.month.obs;

  num prevNumIndex = 0;
  ItemScrollController itemScrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  
  SubscribeManageViewModel() {
    startDate.value = DateTime.utc(currentDate.value.year, currentDate.value.month - 1, 1);
    endDate.value = DateTime.utc(currentDate.value.year, currentDate.value.month + 1, 31);
  }

  void onChangeViewItem(num minIndex) {
    focusedDate.value = calcDate(minIndex);
  }

  void onDaySelected(DateTime selectedDate, DateTime prevFocusedDate) {
    if (!isSameDay(focusedDate.value, selectedDate)) {
      focusedDate.value = selectedDate;
      jumpTo(calcIndex(selectedDate));
    }
  }

  void onFormatChanged(CalendarFormat newFormat) {
    format.value = newFormat;
  }

  void onHeaderTapped(DateTime day) {
    format.value = CalendarFormat.month;
  }

  void scrollTo(num index, Duration duration) {
    itemScrollController.scrollTo(
      index: index, 
      duration: duration,
      curve: Curves.easeInOutCubic);
  }

  void jumpTo(num index) {
    itemScrollController.jumpTo(index: index);
  }

  num calcIndex(DateTime day) {
    return day.difference(startDate.value).inDays;
  }

  DateTime calcDate(num index) {
    print(startDate.value.add(Duration(days: index)));
    return startDate.value.add(Duration(days: index));
  }

  bool selectedDayPredicate(DateTime day) {
    return isSameDay(focusedDate.value, day);
  }
}