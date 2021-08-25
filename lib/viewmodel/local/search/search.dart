import 'package:get/get.dart';
import 'package:subping/model/search_model.dart';
import 'package:subping/repository/search_repository.dart';

class SearchViewModel extends GetxController {
  SearchRepository _searchRepository = SearchRepository();
  RxString _searchText = "".obs;
  Rx<SearchModel> _searchResult = SearchModel().obs;

  @override
  void onInit() {
    super.onInit();

    debounce(_searchText, (String text) async {
      if(text.length != 0) {
        _searchResult.value = await _searchRepository.getSearch(text);
        _searchResult.refresh();
      } else {
        _searchResult.value = SearchModel();
        _searchResult.refresh();
      }
    },
    time: Duration(seconds: 1));
  }

  void onChangeSearchText(String text) {
    _searchText.value = text;
  }

  SearchModel get searchResult {
    return _searchResult.value;
  }
}