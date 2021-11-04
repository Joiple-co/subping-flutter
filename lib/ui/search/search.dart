import 'package:flutter/material.dart';
import 'package:subping/model/search_model.dart';
import 'package:subping/modules/design_system/page/header_safe.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/search/search_bar.dart';
import 'package:subping/ui/search/search_item.dart';

import 'package:subping/viewmodel/local/search/search.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchViewModel = Get.find<SearchViewModel>();

    return Obx(
      () => Scaffold(
          appBar: SearchBar(
            searchViewModel: searchViewModel,
          ),
          body: Container(
              color: SubpingColor.white100,
              child: HorizontalPadding(
                child: ListView(
                  children: [
                    SubpingText("서비스",
                        size: SubpingFontSize.body1,
                        color: SubpingColor.black80),
                    Column(
                      children: List.generate(
                          searchViewModel.searchResult.serviceResult?.length ??
                              0,
                          (index) => SearchItem(
                                serviceResult: searchViewModel
                                    .searchResult.serviceResult[index],
                              )),
                    ),
                    Space(
                      size: SubpingSize.tiny5,
                    ),
                    Container(
                      child: Divider(
                        color: SubpingColor.back20,
                        thickness: 2,
                      ),
                    ),
                    Space(size: SubpingSize.tiny5),
                    SubpingText("검색어 제안",
                        size: SubpingFontSize.body1,
                        color: SubpingColor.black80),
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: Column(
                        children: List.generate(
                            searchViewModel.searchResult.tagResult?.length ?? 0,
                            (index) {
                          final tagResult =
                              searchViewModel.searchResult.tagResult[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/icon/search2.png")),
                                  ),
                                ),
                                Space(
                                  size: SubpingSize.medium14,
                                ),
                                Text.rich(SubpingTextSpan(children: [
                                  SubpingTextSpan(
                                      fontSize: SubpingFontSize.title5,
                                      fontWeight: FontWeight.bold,
                                      text: tagResult.tag.substring(
                                          0, tagResult.search.matchedIndex)),
                                  SubpingTextSpan(
                                      fontSize: SubpingFontSize.title5,
                                      fontWeight: FontWeight.bold,
                                      color: SubpingColor.subping100,
                                      text: tagResult.tag.substring(
                                          tagResult.search.matchedIndex,
                                          tagResult.search.matchedIndex +
                                              tagResult.search.length)),
                                  SubpingTextSpan(
                                      fontSize: SubpingFontSize.title5,
                                      fontWeight: FontWeight.bold,
                                      text: tagResult.tag.substring(
                                          tagResult.search.matchedIndex +
                                              tagResult.search.length)),
                                ]))
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
