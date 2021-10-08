import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/main_tabs/category/category_viewer.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  ScrollController scrollViewController;
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();
    
    serviceViewModel.updateCategory(updateServices: true);

    return Obx(
      () => DefaultTabController(
        length: serviceViewModel.categories.length,
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
                      sliver: SliverAppBar(
                        backgroundColor: SubpingColor.white100,
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
                        serviceViewModel.categories.length,
                        (index) => Tab(
                            child: SubpingText(
                                serviceViewModel.categories[index].name)),
                      ),
                      controller: tabController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: List.generate(
                          serviceViewModel.categories.length, (index) {
                        return CategoryViewer(index.toString(),  //categoryviewer만 제외하라
                            serviceViewModel.categories[index], serviceViewModel, serviceViewModel.categoryServices[serviceViewModel.categories[index].name]);
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
