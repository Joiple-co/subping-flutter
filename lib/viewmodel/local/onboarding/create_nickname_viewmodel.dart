import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/repository/user_repository.dart';

class CreateNickNameViewModel extends GetxController {
  UserRepository _userRepository = UserRepository();
  RxString nickName = "".obs;
  RxBool nickNameVaild = false.obs;
  RxBool loading = false.obs;
  RxString nickNameError = "".obs;
  RxString nickErrorText = "".obs;
  FocusNode inputFocusNode;

  void onInit() {
    super.onInit();

    debounce(nickName, (text) async {
      checkNickNameValid();
    }, time: Duration(milliseconds: 500));
  }

  Future<void> checkNickNameValid() async {
    if (nickName.value.length >= 4) {
      final duplicate = await _userRepository.nickNameDuplicate(nickName.value);

      if (duplicate) {
        nickNameError.value = "이미 사용중인 닉네임입니다.";
        nickNameVaild.value = false;
      } else {
        nickNameVaild.value = true;
        nickNameError.value = "";
      }
    } else {
      nickNameVaild.value = false;
    }
  }

  void onChangedNickName(String text) {
    nickName.value = text;
    nickNameVaild.value = false;
  }

  void onButtonPress() async {
    loading.value = true;

    final result = await _userRepository.updateNickName(nickName.value);

    loading.value = false;

    if (result) {
      Get.offAndToNamed("/mainTabs");
    }
  }

  void focusInput() {
    inputFocusNode.requestFocus();
  }
}
