import 'package:flutter/material.dart';
import 'package:subping/model/auto_complete_model.dart';
import 'package:subping/model/search_model.dart';
import 'package:subping/modules/design_system/page/header_safe.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:subping/ui/search/auto_complete_search/auto_complete_search.dart';
import 'package:subping/ui/search/search_bar.dart';
import 'package:subping/viewmodel/local/search/auto_complete_viewmodel.dart';
import 'package:subping/viewmodel/local/search/search_viewmodel.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(SearchViewModel());

    return Obx(
      () => Scaffold(
          appBar: SearchBar(
            searchViewModel: searchController,
            onFocus: searchController.isFocused.value,
          ),
          ),
          
    );
  }
}









// class Search extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final autoCompleteViewModel = Get.find<AutoCompleteViewModel>();
//     //final searchViewModel = Get.find<SearchViewModel>();
//     //final SearchModel searchResult;
    

//     return Obx(
//       () => Scaffold(
//           appBar: SearchBar(
//             autoCompleteResult : AutoCompleteViewModel,
//           ),
//           body: RelatedKeywordSearch(
//             autoCompleteResult : autoCompleteViewModel.getAutoComplete,  
//             //searchResult : searchViewModel.searchResult,           
//           )
//           ),
//     );
//   }
// }

