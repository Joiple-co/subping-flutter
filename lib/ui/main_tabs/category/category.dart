import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/main_tabs/category/category_viewer.dart';
import 'package:subping/viewmodel/category_viewmodel.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  ScrollController scrollViewController;
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    final categoryViewModel = Get.find<CategoryViewModel>();

    return Obx(() => DefaultTabController(
          length: categoryViewModel.categories.length,
          child: HeaderSafe(
            child: Scaffold(
                backgroundColor: SubpingColor.back20,
                body: NestedScrollView(
                  controller: scrollViewController,
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
                        tabs: List.generate(categoryViewModel.categories.length, (index) => 
                          Tab(child: SubpingText(categoryViewModel.categories[index].category)),
                        ),
                        controller: tabController,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: List.generate(categoryViewModel.categories.length, (index) {
                          return CategoryViewer(index.toString(), categoryViewModel.categories[index]);                    
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
