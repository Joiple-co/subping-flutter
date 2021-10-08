import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:subping/model/auto_complete_model.dart';
import 'package:subping/model/search_model.dart';
import 'package:subping/repository/search_repository.dart';

class SearchViewModel extends GetxController {
  SearchRepository _searchRepository = SearchRepository();
  RxString _searchText = "".obs;
  Rx<AutoCompleteModel> _autoCompleteResult = AutoCompleteModel().obs;

  TextEditingController _searchTextEditingController = TextEditingController();
  RxBool isFocused = false.obs;
  
  @override
  void onInit() {
    super.onInit();

    debounce(_searchText, (String text) async {
      if(text.length != 0) {
        _autoCompleteResult.value = await _searchRepository.getAutoComplete(text);
        _autoCompleteResult.refresh();
       // print(_autoCompleteResult.value.tagResult[0].tag);
       // print(_autoCompleteResult.value.serviceResult[0]);
      } else {
        _autoCompleteResult.value = AutoCompleteModel();
        _autoCompleteResult.refresh();
      }
    },
    time: Duration(seconds: 1));
  }

  void onChangeSearchText(String text) {
    _searchText.value = text;
  }

  void onClickClear() {
    _searchText.value = "";
    _searchTextEditingController.clear();
  }

  AutoCompleteModel get autoCompleteResult {
    return _autoCompleteResult.value;
  }

  TextEditingController get searchTextEditingController {
    return _searchTextEditingController;
  }

  String get searchText {
    return _searchText.value;
  }
}