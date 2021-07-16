import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/main_tabs/category/category_viewer.dart';
import 'package:subping/ui/main_tabs/category/category_viewmodel.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_calendar.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_manage_viewModel.dart';

class SubscribeManage extends StatelessWidget {
  const SubscribeManage() : super();

  @override
  Widget build(BuildContext context) {
    Get.put(SubscribeManageViewModel());

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
                    padding: EdgeInsets.fromLTRB(20.w, 0, 0, 20.h),
                    constraints: BoxConstraints(maxHeight: 70.h),
                    child: TabBar(
                      labelStyle: TextStyle(fontSize: 28.nsp),
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
                      tabs: List.generate(viewModel.categories.length, (index) => 
                        Tab(child: SubpingText(viewModel.categories[index])),
                      ),
                      controller: viewModel.tabController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: viewModel.tabController,
                      children: [Container(), SubscribeCalendar()]
                    ),
                  ),
                ]),
              )),
        ),
      ),
    );
  }
}
