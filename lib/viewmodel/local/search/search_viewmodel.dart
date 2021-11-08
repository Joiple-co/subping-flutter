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
      if (text.length != 0) {
        _autoCompleteResult.value =
            await _searchRepository.getAutoComplete(text);
        _autoCompleteResult.refresh();
      } else {
        _autoCompleteResult.value = AutoCompleteModel();
        _autoCompleteResult.refresh();
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

  AutoCompleteModel get autoCompleteResult {
    return _autoCompleteResult.value;
  }
  //위에는 자동완성 관련 데이터 만들었으니 이자리에는 결과페이지에 필요한 데이터 받는걸로

  TextEditingController get searchTextEditingController {
    return _searchTextEditingController;
  }

  String get searchText {
    return _searchText.value;
  }

  MatchedModel getAutoCompleteTextProperty(int index) {
    int _matchedServiceNameIndex = _autoCompleteResult
        .value.serviceResult[index].name
        .indexOf(_searchText);
    _matchedServiceNameIndex =
        (_matchedServiceNameIndex == -1 ? 0 : _matchedServiceNameIndex);

    int _matchedTextIndex = _searchText.indexOf(_autoCompleteResult
        .value.serviceResult[index].name[_matchedServiceNameIndex]);
    _matchedTextIndex = _matchedTextIndex == -1 ? 0 : _matchedTextIndex;

    int _matchedLength = 0;
    int compareSearchTextLength = searchText.length - _matchedTextIndex;

    for (int i = _matchedServiceNameIndex;
        i < _autoCompleteResult.value.serviceResult[index].name.length &&
            _matchedTextIndex < compareSearchTextLength;
        i++) {
      if (_searchText.value[_matchedTextIndex++] ==
          _autoCompleteResult.value.serviceResult[index].name[i]) {
        _matchedLength++;
      } else
        break;
    }

    return MatchedModel(_matchedServiceNameIndex, _matchedLength);
  }

  MatchedTagModel getTagTextProperty(int index) {
    int _matchedTagIndex =
        _autoCompleteResult.value.tagResult[index].tag.indexOf(_searchText);
    _matchedTagIndex = (_matchedTagIndex == -1 ? 0 : _matchedTagIndex);

    int _matchedTextIndex = _searchText.indexOf(
        _autoCompleteResult.value.tagResult[index].tag[_matchedTagIndex]);
    _matchedTextIndex = _matchedTextIndex == -1 ? 0 : _matchedTextIndex;

    int _matchedLength = 0;
    int compareSearchTextLength = searchText.length - _matchedTextIndex;

    for (int i = _matchedTagIndex;
        i < _autoCompleteResult.value.tagResult[index].tag.length &&
            _matchedTextIndex < compareSearchTextLength;
        i++) {
      if (_searchText.value[_matchedTextIndex++] ==
          _autoCompleteResult.value.tagResult[index].tag[i]) {
        _matchedLength++;
      } else
        break;
    }

    return MatchedTagModel(_matchedTagIndex, _matchedLength);
  }
}


class MatchedModel {
  num matchedServiceNameIndex;
  num matchedLength;

  MatchedModel(this.matchedServiceNameIndex, this.matchedLength);
}

class MatchedTagModel {
  num matchedTagIndex;
  num matchedLength;

  MatchedTagModel(this.matchedTagIndex, this.matchedLength);
}
