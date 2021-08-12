import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/main_tabs/category/category_viewer.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_calendar.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe/subscribe_manage_viewModel.dart';

class SubscribeManage extends StatelessWidget {
  const SubscribeManage() : super();

  @override
  Widget build(BuildContext context) {
    return GetX<SubscribeManageViewModel>(
      builder: (viewModel) => DefaultTabController(
        length: viewModel.categories.length,
        child: HeaderSafe(
          child: Scaffold(
              backgroundColor: SubpingColor.back20,
              body: NestedScrollView(
                controller: viewModel.scrollViewController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverSafeArea(
                        top: false,
                        bottom: false,
                        sliver: SliverAppBar(
                          backgroundColor: SubpingColor.white100,
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            collapseMode: CollapseMode.pin,
                          ),
                          centerTitle: false,
                          title: SubpingText("구독관리",
                              color: SubpingColor.black100,
                              fontWeight: SubpingFontWeight.bold,
                              size: SubpingFontSize.title5),
                          leadingWidth: 0.w,
                          elevation: 0,
                          pinned: false,
                          forceElevated: innerBoxIsScrolled,
                        ),
                      ),
                    ),
                  ];
                },
                body: Column(children: [
                  Container(
                    color: SubpingColor.white100,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    constraints: BoxConstraints(maxHeight: 35),
                    child: TabBar(
                      labelStyle: TextStyle(fontSize: 14),
                      labelColor: SubpingColor.white100,
                      unselectedLabelColor: SubpingColor.black100,
                      indicator: BoxDecoration(
                        color: SubpingColor.subping100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      indicatorColor:
                          SubpingColor.subping100, // Tab Bar directive
                      indicatorWeight: 0,
                      isScrollable: true,
                      tabs: List.generate(
                        viewModel.categories.length,
                        (index) => Tab(
                            child: SubpingText(viewModel.categories[index])),
                      ),
                      controller: viewModel.tabController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: viewModel.tabController,
                        children: [Container(), SubscribeCalendar()]),
                  ),
                ]),
              )),
        ),
      ),
    );
  }
}
