import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/viewmodel/local/search/search.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final SearchViewModel searchViewModel;

  const SearchBar({this.searchViewModel, Key key}) : super(key: key);

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
        padding: const EdgeInsets.fromLTRB(13, 5, 13, 5),
        width: 680.w,
        decoration: BoxDecoration(
            color: SubpingColor.back20,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Obx(
          () => TextField(
            controller: searchViewModel.searchTextEditingController,
            onChanged: searchViewModel.onChangeSearchText,
            cursorColor: SubpingColor.subping100,
            cursorHeight: SubpingSize.large24,
            style: TextStyle(fontSize: SubpingFontSize.title6),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[ㄱ-ㅎ 가-힣 a-z A-Z 0-9]')),
            ],
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 9),
                hintText: "검색어를 입력해주세요",
                hintStyle: TextStyle(
                    fontSize: SubpingFontSize.title6,
                    color: SubpingColor.black60),
                suffixIcon: searchViewModel.searchText.isEmpty
                    ? null
                    : IconButton(
                        icon: Image.asset('assets/icon/clear_X_Icon.png',
                            width: 24, height: 24),
                        onPressed: searchViewModel.onClickClear,
                      )),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
