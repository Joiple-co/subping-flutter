import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';


class HorizontTabBar extends StatelessWidget {
  
  final GetxController viewModel;
  final List<String> categories;

  ScrollController scrollViewController;
  TabController tabController;

  HorizontTabBar({this.viewModel , this.categories});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: categories.length,
        child: HeaderSafe(    
          child: Scaffold(
              backgroundColor: SubpingColor.back20,
              body: NestedScrollView(
                controller: scrollViewController,             
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
                        categories.length,
                        (index) => Tab(
                            child: SubpingText(
                                categories[index])),
                      ),
                      controller: tabController,
                    ),
                  ),
                  // Expanded(
                  //   child: TabBarView(
                  //     controller: tabController,
                  //     children: List.generate(
                  //         widget.categories.length, (index) {
                  //       return CategoryViewer(index.toString(),//요기 categoryViewer가 문제다
                  //           widget.viewModel.categories[index], widget.viewModel, widget.viewModel.categoryServices[widget.viewModel.categories[index].name]);
                  //     }),
                  //   ),
                  // ),
                ]),
              )),
        ),
      ),
    );
  }
}












