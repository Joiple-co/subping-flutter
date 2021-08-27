import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:subping/model/subscribe_blcok_model.dart';
import 'package:subping/repository/subscribe_calendar_repository.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class SubscribeManageViewModel extends GetxController {
  SubScribeCanlendarRepository _canlendarRepository =
      SubScribeCanlendarRepository();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Rx<DateTime> currentDate = DateTime.now().obs;
  Rx<DateTime> focusedDate = DateTime.now().obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<DateTime> prevFocusedDate = DateTime.now().obs;
  Rx<CalendarFormat> format = CalendarFormat.month.obs;
  RxList<String> categories = ["관리", "캘린더"].obs;
  RxList<SubScribeBlockModel> enableDays = <SubScribeBlockModel>[].obs;
  RxBool _isLoading = true.obs;

  TabController tabController;
  ScrollController scrollViewController;
  ItemScrollController itemScrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  SubscribeManageViewModel() {
    startDate.value =
        DateTime.utc(currentDate.value.year, currentDate.value.month - 1, 1);
    endDate.value =
        DateTime.utc(currentDate.value.year, currentDate.value.month + 1, 31);
  }

  bool get isLoading {
    return _isLoading.value;
  }

  void onChangeViewItem(num minIndex) {
    if (prevFocusedDate.value != calcDate(minIndex)) {
      prevFocusedDate.value = focusedDate.value;
      focusedDate.value = calcDate(minIndex);
    }
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
        index: index, duration: duration, curve: Curves.easeInOutCubic);
  }

  void jumpTo(num index) {
    itemScrollController.jumpTo(index: index);
  }

  num calcIndex(DateTime day) {
    return enableDays.value
        .indexWhere((element) => isSameDay(day, element.date));
  }

  DateTime calcDate(num index) {
    return enableDays.value[index].date;
  }

  bool selectedDayPredicate(DateTime day) {
    return isSameDay(focusedDate.value, day);
  }

  void sortingDate(List<SubScribeBlockModel> listOfDays) {
    listOfDays.sort((a, b) => a.date.compareTo(b.date));
  }

  void onInitEnableList() async {
    final response = await _canlendarRepository.getCalendarData();
    int tempMonth = 0;

    response.sort((a, b) => a.date.compareTo(b.date));

    response.forEach((element) {
      if (tempMonth != element.date.month) {
        element.firstOfMonth = true;
        tempMonth = element.date.month;
      }
    });

    enableDays.value = response;
    onInitDateValue();
  }

  void onInitDateValue() {
    focusedDate.value = enableDays.value[0].date;
    startDate.value = DateTime.utc(
        enableDays.value.first.date.year, enableDays.value.first.date.month, 1);
    endDate.value = DateTime.utc(
        enableDays.value.last.date.year, enableDays.value.last.date.month, 31);
    _isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    onInitEnableList();
  }

  bool enabledDayPredicate(DateTime day) {
    if (enableDays.value.isEmpty) {
      return false;
    } else {
      for (int i = 0; i < enableDays.value.length; i++) {
        if (isSameDay(enableDays.value[i].date, day)) {
          return true;
        }
      }
      return false;
    }
  }
}
