import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_calendar.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_management.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewmodel.dart';

class SubscribeManage extends StatelessWidget {
  const SubscribeManage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscribeManageViewModel = Get.find<SubscribeManageViewModel>();
    subscribeManageViewModel.updateSubscribeSchedule();

    return DefaultTabController(
      length: 2,
      child: HeaderSafe(
          hasBottomSafe: false,
          child: Scaffold(
            appBar: const TitleAppBar("구독관리"),
            backgroundColor: SubpingColor.back20,
            body: Column(children: [
              Container(
                color: SubpingColor.white100,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                constraints: const BoxConstraints(maxHeight: 35),
                child: TabBar(
                  labelStyle: const TextStyle(fontSize: 14),
                  labelColor: SubpingColor.white100,
                  unselectedLabelColor: SubpingColor.black100,
                  indicator: BoxDecoration(
                    color: SubpingColor.subping100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  indicatorColor: SubpingColor.subping100, // Tab Bar directive
                  indicatorWeight: 0,
                  isScrollable: true,
                  tabs: List.generate(
                    2,
                    (index) => Tab(
                        child: SubpingText(
                      ["관리", "캘린더"][index],
                      size: null,
                    )),
                  ),
                  controller: subscribeManageViewModel.tabController,
                ),
              ),
              Expanded(
                child: TabBarView(
                    controller: subscribeManageViewModel.tabController,
                    children: const [
                      SubscribeManagement(),
                      SubscribeCalendar()
                    ]),
              ),
            ]),
          )),
    );
  }
}
