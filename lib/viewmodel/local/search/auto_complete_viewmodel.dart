import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:subping/model/auto_complete_model.dart';
import 'package:subping/repository/search_repository.dart';

class AutoCompleteViewModel extends GetxController {
  SearchRepository _searchRepository = SearchRepository();
  RxString _autoCompleteText = "".obs;
  Rx<AutoCompleteModel> _autoCompleteResult = AutoCompleteModel().obs;
  TextEditingController _autoCompleteTextEditingController = TextEditingController();
  RxBool isFocused = false.obs;
  //내가 추가해준거 (아래)
  RxMap<int, int> autoCompleteTextProperty = <int, int>{}.obs;


  
  @override
  void onInit() {
    super.onInit();
    debounce(_autoCompleteText, (String text) async {
      if(text.length != 0) {
        _autoCompleteResult .value = await _searchRepository.getAutoComplete(text);
        _autoCompleteResult .refresh();
      } else {
        _autoCompleteResult.value = AutoCompleteModel();
        _autoCompleteResult .refresh();
      }
    },
    time: Duration(seconds: 1));
  }

  void onChangeAutoCompleteText(String text) {
    _autoCompleteText.value = text;
  }

  void onClickClear() {
    _autoCompleteText.value = "";
    _autoCompleteTextEditingController.clear();
  }

  AutoCompleteModel get autoCompleteResult {
    return _autoCompleteResult.value;
  }

  TextEditingController get autoCompleteTextEditingController {
    return _autoCompleteTextEditingController;
  }

  String get autoCompleteText {
    return _autoCompleteText.value;
  }

  void getAutoCompleteTextProperty(){
      int matchedIndex=
      _autoCompleteResult.value.serviceResult[0].name.indexOf(_autoCompleteText);
  
}

}

