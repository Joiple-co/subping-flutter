import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/model/category_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/category/category_service_item.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';


class CategoryViewer extends StatelessWidget {
  final String index;
  final CategoryModel categoryModel;
  final ServiceViewModel serviceViewModel;
  final List<ServiceModel> services;

  CategoryViewer(this.index, this.categoryModel, this.serviceViewModel, this.services);

  @override
  Widget build(BuildContext context) {
    serviceViewModel.updateCategoryServices(categoryModel);

    return Obx(
      () => RefreshIndicator(
        color: SubpingColor.subping100,
        backgroundColor: SubpingColor.white100,
        onRefresh: () => serviceViewModel.updateCategoryServices(categoryModel),
        child: Container(
          child: Column(
            children: [
              Space(size: SubpingSize.medium10),
              Expanded(
                child: Container(
                  color: SubpingColor.white100,
                  child: HorizontalPadding(
                    child: CustomScrollView(
                        key: PageStorageKey("category_viewer_${index}"),
                        slivers: [
                          SliverList(
                              delegate: SliverChildListDelegate([
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubpingText(
                                    "전체 ${(serviceViewModel.categoryServices[categoryModel.name] ?? []).length}개",
                                    size: SubpingFontSize.tiny1),
                                TextButton(
                                    child: SubpingText("추천순",
                                        size: SubpingFontSize.tiny1),
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerRight,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap)),
                              ],
                            ),
                            Space(
                              size: SubpingSize.medium10,
                            )
                          ])),
                          SliverGrid.count(
                            childAspectRatio: 360 / 550,
                            crossAxisSpacing: 28.w,
                            mainAxisSpacing: 20.h,
                            crossAxisCount: 2,
                            children: List.generate(
                                (services ?? []).length, (index) {
                              return CategoryServiceItem(
                                  item: (services ?? [])[index]);
                            }),
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
