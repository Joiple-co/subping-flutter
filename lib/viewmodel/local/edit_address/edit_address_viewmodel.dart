import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/modules/design_system/appbar/title_appbar.dart';
import 'package:subping/repository/user_repository.dart';

class EditAddressViewModel extends GetxController {
  RxBool isDefault = true.obs;
  RxBool isValid = false.obs;
  RxBool loading = false.obs;

  UserRepository _userRepository = UserRepository();

  FocusNode detailedAddressFocusNode = FocusNode();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailedAddressController = TextEditingController();

  MaskTextInputFormatter phoneNumberFormatter = new MaskTextInputFormatter(
      mask: '###-####-####', filter: {"#": RegExp(r'[0-9]')});

  void setExistAddress(UserAddressModel address) {
    userNameController.text = address.userName;
    phoneNumberController.text = phoneNumberFormatter.maskText(address.userPhoneNumber);
    postCodeController.text = address.postCode;
    addressController.text = address.address;
    detailedAddressController.text = address.detailedAddress;
    isDefault.value = address.isDefault;
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
    
  }

  void onSubmit() async {
    if (isValid.value) {
     
    }
  }
}
