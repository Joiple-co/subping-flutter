import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/ui/design_system/settingTable.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/category/category_service_item.dart';

class CategoryViewer extends StatelessWidget {
  final String index;
  final List<ServiceModel> items;

  const CategoryViewer(this.index, {this.items}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Space(size: SubpingSize.medium20),
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
                        SubpingText("전체 ${items.length}개", size: SubpingFontSize.tiny1),
                        TextButton(
                            child:
                                SubpingText("추천순", size: SubpingFontSize.tiny1),
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight,
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap)),
                      ],
                    ),
                    Space(size: SubpingSize.medium20,)
                  ])),
                  SliverGrid.count(
                    childAspectRatio: (360.w / 530.h),
                    crossAxisSpacing: 28.w,
                    mainAxisSpacing: 20.h,
                    crossAxisCount: 2, 
                    children: List.generate(items.length, (index) {
                      return CategoryServiceItem(item: items[index]);
                    }),)
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
