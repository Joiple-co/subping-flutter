import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/modules/design_system/appbar/title_appbar.dart';
import 'package:subping/repository/user_repository.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

class EditAddressViewModel extends GetxController {
  RxBool isDefault = true.obs;
  RxBool isValid = false.obs;
  RxBool loading = false.obs;

  UserRepository _userRepository = UserRepository();
  UserViewModel _userViewModel = Get.find<UserViewModel>();

  FocusNode detailedAddressFocusNode = FocusNode();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailedAddressController = TextEditingController();

  MaskTextInputFormatter phoneNumberFormatter = new MaskTextInputFormatter(
      mask: '###-####-####', filter: {"#": RegExp(r'[0-9]')});

  UserAddressModel beforeAddress;

  void setExistAddress(UserAddressModel address) {
    userNameController.text = address.userName;
    phoneNumberController.text =
        phoneNumberFormatter.maskText(address.userPhoneNumber);
    postCodeController.text = address.postCode;
    addressController.text = address.address;
    detailedAddressController.text = address.detailedAddress;
    isDefault.value = address.isDefault;

    beforeAddress = address;
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
    postCodeController.text = kpostalmodel.postCode;
    addressController.text = kpostalmodel.address;

    detailedAddressFocusNode.requestFocus();
    checkValid();
  }

  void onClickIsDefault(bool value) {
    isDefault.value = value;
    checkValid();
  }

  void checkValid() {
    final newAddress = new UserAddressModel();

    newAddress.userName = userNameController.text;
    newAddress.userPhoneNumber = phoneNumberController.text;
    newAddress.postCode = postCodeController.text;
    newAddress.address = addressController.text;
    newAddress.detailedAddress = detailedAddressController.text;
    newAddress.isDefault = isDefault.value;

    if (userNameController.text.length > 0 &&
        phoneNumberController.text.length > 0 &&
        postCodeController.text.length > 0 &&
        addressController.text.length > 0 &&
        detailedAddressController.text.length > 0 && !beforeAddress.isSame(newAddress)) {
      isValid.value = true;
    } else {
      isValid.value = false;
    }
  }

  void onSubmit() async {
    if (isValid.value) {
      loading.value = true;
      
      final address = new UserAddressModel();

      address.id = beforeAddress.id;
      address.userName = userNameController.text;
      address.userPhoneNumber = phoneNumberController.text;
      address.postCode = postCodeController.text;
      address.address = addressController.text;
      address.detailedAddress = detailedAddressController.text;
      address.isDefault = isDefault.value;

      final result = await _userRepository.editUserAddress(address);

      if(result == true) {
        await _userViewModel.updateUserAddresses();
        loading.value = false;

        Get.back();
      } else {
        loading.value = false;
      }
    }
  }
}
