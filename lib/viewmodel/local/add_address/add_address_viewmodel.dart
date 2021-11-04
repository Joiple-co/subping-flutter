import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/modules/design_system/appbar/title_appbar.dart';
import 'package:subping/repository/user_repository.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

class AddAddressViewModel extends GetxController {
  String postCode = "";
  String address = "";
  String detailAddress = "";
  RxBool isDefault = true.obs;
  RxBool isValid = false.obs;
  RxBool loading = false.obs;

  final UserRepository _userRepository = UserRepository();

  FocusNode detailedAddressFocusNode = FocusNode();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  MaskTextInputFormatter phoneNumberFormatter = MaskTextInputFormatter(
      mask: '###-####-####', filter: {"#": RegExp(r'[0-9]')});

  void setUserDefaultInfo(String userName, String phoneNumber) {
    userNameController.text = userName;
    phoneNumberController.text = phoneNumberFormatter.maskText(phoneNumber);
    checkValid();
  }

  void routingKopo(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => KpostalView(
              appBar: TitleAppBar(
                "우편번호 찾기",
                hasBackButton: true,
              ),
              callback: (kopoModel) => setAddressInform(kopoModel),
            )));
  }

  void setAddressInform(Kpostal kpostalmodel) {
    postCode = kpostalmodel.postCode;
    address = kpostalmodel.address;

    zipCodeController.text = kpostalmodel.postCode;
    addressController.text = kpostalmodel.address;

    detailedAddressFocusNode.requestFocus();
    checkValid();
  }

  void onChangeDetailAddress(String text) {
    detailAddress = text;
    checkValid();
  }

  void onClickIsDefault(bool value) {
    isDefault.value = value;
    checkValid();
  }

  void checkValid() {
    isValid.value = !(postCode.isEmpty ||
        postCode.isEmpty ||
        detailAddress.isEmpty ||
        userNameController.text.length < 2 ||
        phoneNumberFormatter.unmaskText(phoneNumberController.text).length <
            10);
  }

  void onSubmit() async {
    if (isValid.value) {
      loading.value = true;

      final userAddress = UserAddressModel(
          postCode: postCode,
          address: address,
          detailedAddress: detailAddress,
          isDefault: isDefault.value,
          userName: userNameController.text,
          userPhoneNumber: phoneNumberController.text);

      await _userRepository.makeUserAddress(userAddress);
      final _userViewModel = Get.find<UserViewModel>();
      await _userViewModel.updateUserAddresses();

      loading.value = false;

      Get.back();
    }
  }
}
