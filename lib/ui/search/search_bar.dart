import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/viewmodel/local/search/search_viewmodel.dart';


class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final SearchViewModel searchViewModel;
  final bool autoFocus;
  final bool onFocus;
  final Function onBlur;

  SearchBar(
      {this.searchViewModel, this.autoFocus = true, this.onFocus, this.onBlur});

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(65);
}
class _SearchBarState extends State<SearchBar> {
  final FocusNode searchFocusNode = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   searchFocusNode.addListener(() {
  //     if (searchFocusNode.hasFocus) {
  //       if(widget.onFocus != null) {
  //         widget.onFocus();
  //       } else {
  //         print("[searchBar] onFocus가 없습니다.");
  //       }
  //     } else {
  //       if(widget.onBlur != null) {
  //         widget.onBlur();
  //       } else {
  //         print("[searchBar] onBlur가 없습니다.");
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SubpingColor.white100,
      elevation: 0,
      titleSpacing: 0.0,
      leading: IconButton(
        onPressed: Get.back,
        icon: Icon(
          Icons.chevron_left,
          size: 30,
          color: SubpingColor.black100,
        ),
      ),
      title: Container(
        padding: EdgeInsets.fromLTRB(13, 5, 13, 5),
        width: 680.w,
        decoration: BoxDecoration(
            color: SubpingColor.back20,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Obx(
          () => TextField(
            focusNode: searchFocusNode,
            autofocus: widget.autoFocus,
            controller: widget.searchViewModel.searchTextEditingController,
            onChanged: widget.searchViewModel.onChangeSearchText,
            // onSubmitted: (value) => print(value),
            cursorColor: SubpingColor.subping100,
            cursorHeight: SubpingSize.large24,
            style: TextStyle(fontSize: SubpingFontSize.title6),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[ㄱ-ㅎ 가-힣 a-z A-Z 0-9]')),
            ],
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 9),
                hintText: "검색어를 입력해주세요",
                hintStyle: TextStyle(
                    fontSize: SubpingFontSize.title6,
                    color: SubpingColor.black60),
                suffixIcon: widget.searchViewModel.searchText.length == 0
                    ? null
                    : IconButton(
                        icon: new Image.asset('assets/icon/clear_X_Icon.png',
                            width: 24, height: 24),
                        onPressed: widget.searchViewModel.onClickClear,
                      )),
          ),
        ),
      ),
    );
  }
}