import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:subping/model/search_model.dart';
import 'package:subping/repository/search_repository.dart';

class SearchViewModel extends GetxController {
  SearchRepository _searchRepository = SearchRepository();
  RxString _searchText = "".obs;
  Rx<SearchModel> _searchResult = SearchModel().obs;
  TextEditingController _searchTextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    debounce(_searchText, (String text) async {
      if (text.length != 0) {
        _searchResult.value = await _searchRepository.getSearch(text);
        _searchResult.refresh();
      } else {
        _searchResult.value = SearchModel();
        _searchResult.refresh();
      }
    }, time: Duration(seconds: 1));
  }

  void onChangeSearchText(String text) {
    _searchText.value = text;
  }

  void onClickClear() {
    _searchText.value = "";
    _searchTextEditingController.clear();
  }

  SearchModel get searchResult {
    return _searchResult.value;
  }

  TextEditingController get searchTextEditingController {
    return _searchTextEditingController;
  }

  String get searchText {
    return _searchText.value;
  }
}
