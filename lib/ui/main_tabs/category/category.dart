import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/main_tabs/category/category_viewer.dart';
import 'package:subping/ui/main_tabs/category/category_viewmodel.dart';

class Category extends StatelessWidget {
  const Category() : super();

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(CategoryViewModel());

    ScrollController _scrollViewController;
    TabController _tabController;

    return GetX<CategoryViewModel>(
      builder: (viewModel) => DefaultTabController(
        length: viewModel.services.length,
        child: HeaderSafe(
          child: Scaffold(
              backgroundColor: SubpingColor.back20,
              body: NestedScrollView(
                controller: _scrollViewController,
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
                          title: SubpingText("카테고리",
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
                      tabs: List.generate(viewModel.services.length, (index) => 
                        Tab(child: SubpingText(viewModel.services.keys.elementAt(index))),
                      ),
                      controller: _tabController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: List.generate(viewModel.services.value.length, (index) {
                        String key = viewModel.services.keys.elementAt(index);

                        return CategoryViewer(items: viewModel.services.value[key]);                    
                      }),
                    ),
                  ),
                ]),
              )),
        ),
      ),
    );
  }
}
