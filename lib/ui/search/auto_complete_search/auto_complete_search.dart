import 'package:flutter/material.dart';
import 'package:subping/model/auto_complete_model.dart';

import 'package:subping/model/search_model.dart';
import 'package:subping/modules/design_system/page/header_safe.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/search/auto_complete_search/auto_complete_service_item.dart';

import 'package:subping/viewmodel/local/search/search_viewmodel.dart';

import 'auto_complete_tag_item.dart';


class AutoCompleteSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchViewModel = Get.find<SearchViewModel>();

    return Obx(
      () => Container(
        color: SubpingColor.white100,
        child: HorizontalPadding(
          child: ListView(
            children: [
              SubpingText("서비스",
                  size: SubpingFontSize.body1, color: SubpingColor.black80),
              Column(
                children: List.generate(
                    searchViewModel.autoCompleteResult.serviceResult?.length ??
                        0,
                    (index) => AutoCompleteServiceItem(
                        serviceResult: searchViewModel
                            .autoCompleteResult.serviceResult[index],
                        itemIndex: index,
                        matchedServiceNameIndex: searchViewModel
                            .getAutoCompleteTextProperty(index)
                            .matchedServiceNameIndex,
                        matchedLength: searchViewModel
                            .getAutoCompleteTextProperty(index)
                            .matchedLength)),
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
                  size: SubpingFontSize.body1, color: SubpingColor.black80),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  children: List.generate(
                      searchViewModel.autoCompleteResult.tagResult?.length ?? 0,
                      (index) {
                    final tagResult =
                        searchViewModel.autoCompleteResult.tagResult[index];
                    int matchedTagIndex = searchViewModel
                        .getTagTextProperty(index)
                        .matchedTagIndex;
                    int matchedLength =
                        searchViewModel.getTagTextProperty(index).matchedLength;
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
                                  image: AssetImage("assets/icon/search2.png")),
                            ),
                          ),
                          Space(
                            size: SubpingSize.medium14,
                          ),
                          Text.rich(SubpingTextSpan(children: [
                            SubpingTextSpan(
                                fontSize: SubpingFontSize.title5,
                                fontWeight: FontWeight.bold,
                                text: tagResult.tag
                                    .substring(0, matchedTagIndex)),
                            SubpingTextSpan(
                                fontSize: SubpingFontSize.title5,
                                fontWeight: FontWeight.bold,
                                color: SubpingColor.subping100,
                                text: tagResult.tag.substring(matchedTagIndex,
                                    matchedTagIndex + matchedLength)),
                            SubpingTextSpan(
                                fontSize: SubpingFontSize.title5,
                                fontWeight: FontWeight.bold,
                                text: tagResult.tag.substring(
                                    matchedTagIndex + matchedLength)),
                          ]))
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
