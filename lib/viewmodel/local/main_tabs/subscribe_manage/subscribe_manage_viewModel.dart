import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:subping/model/subscribe_schedule_model.dart';
import 'package:subping/repository/subscribe_repository.dart';

class SubscribeManageViewModel extends GetxController
    with SingleGetTickerProviderMixin {
  final SubscribeRepository _subscribeRepository = SubscribeRepository();
  final RxInt _focusedMonth = 0.obs;
  final RxMap<String, Map<String, List<SubscribeScheduleModel>>> _schedules =
      <String, Map<String, List<SubscribeScheduleModel>>>{}.obs;
  final RxInt _highlightIndex = 0.obs;

  ItemScrollController itemScrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  TabController tabController;

  Future<void> updateSubscribeSchedule() async {
    final schedules = await _subscribeRepository.getSubscribeSchedule();

    _schedules.value = schedules;
    _schedules.refresh();
  }

  void toggleFocusedMonth() {
    if (_focusedMonth.value == 0) {
      _focusedMonth.value = 1;
    } else {
      _focusedMonth.value = 0;
    }
  }

  void jumpToIndex(int index) {
    itemScrollController.jumpTo(index: index);
  }

  void onChangeMinIndex(int index) {
    _highlightIndex.value = index;
  }

  void changeTab(int index) {
    tabController.animateTo(index);
  }

  Map<String, int> get paidAndTotalPriceOfThisMonth {
    final result = {"total": 0, "paid": 0};

    if (_schedules.keys.isNotEmpty) {
      final month = _schedules.keys.elementAt(0);
      final schedules = _schedules[month];

      schedules.forEach((key, value) {
        for (var schedule in value) {
          result['total'] += schedule.totalPrice;
          if (schedule.status == "결제 완료") {
            result['paid'] += schedule.totalPrice;
          }
        }
      });
    }

    return result;
  }

  String get focusedMonth {
    if (_schedules.keys.isNotEmpty) {
      return _schedules.keys.elementAt(_focusedMonth.value);
    } else {
      return "00";
    }
  }

  int get highlightIndex {
    return _highlightIndex.value;
  }

  Map<String, Map<String, List<SubscribeScheduleModel>>> get schedules {
    return _schedules;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }
}
