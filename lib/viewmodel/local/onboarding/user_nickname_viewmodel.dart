import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class UserNickNameViewModel extends GetxController {
  RxList<String> nickName = [].obs;
  RxBool nickNameVaild = false.obs;
  RxBool nickNameError = false.obs;
  RxString nickErrorText = "".obs;
  FocusNode inputFocusNode;

  bool checkNickNameVaild() {
    return RegExp(r'/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/')
        .hasMatch(nickName.value.join());
  }

  void onChangedNickName(String a) {
    if (checkNickNameVaild() && nickName.length > 4) {
      nickNameVaild.value = true;
      nickNameError.value = false;
    } else {}
  }

  void onButtonPress() {
    print("서버 연동");
  }

  void focusInput() {
    inputFocusNode.requestFocus();
  }
}
