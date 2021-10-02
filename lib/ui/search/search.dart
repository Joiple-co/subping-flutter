import 'package:flutter/material.dart';
import 'package:subping/model/search_model.dart';
import 'package:subping/modules/design_system/page/header_safe.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/search/related_keyword_search/related_keyword_search.dart';
import 'package:subping/ui/search/search_bar.dart';
import 'package:subping/ui/search/related_keyword_search/search_item.dart';

import 'package:subping/viewmodel/local/search/search_viewmodel.dart';

class Search extends StatelessWidget {

  
 

  @override
  Widget build(BuildContext context) {
    final searchViewModel = Get.find<SearchViewModel>();
    //final SearchModel searchResult;

    return Obx(
      () => Scaffold(
          appBar: SearchBar(
            searchViewModel: searchViewModel,
          ),
          body: RelatedKeywordSearch(
            searchResult : searchViewModel.searchResult,           
          )
          ),
    );
  }
}

