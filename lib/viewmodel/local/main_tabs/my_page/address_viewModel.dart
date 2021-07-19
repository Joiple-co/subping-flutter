import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopo/kopo.dart';
import 'package:subping/model/address_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/address_repository.dart';

class AddAddressViewModel extends GetxController {
  String zipCode = "";
  String address = "";
  String detailAddress = "";

  FocusNode detailedAddressFocusNode = FocusNode();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void routingKopo(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Kopo(
              callback: (kopoModel) => setAddressInform(kopoModel),
            )));
  }

  void setAddressInform(KopoModel kopoModel) {
    zipCode = kopoModel.zonecode;
    address = kopoModel.address;

    zipCodeController.text = kopoModel.zonecode;
    addressController.text = kopoModel.address;

    detailedAddressFocusNode.requestFocus();
  }

  void onChangeDetailAddress(String text) {
    detailAddress = text;
  }

  bool checkValid() {
    return (zipCode.length == 0 ||
        zipCode.length == 0 ||
        detailAddress.length < 4);
  }

  void onSubmit() async {
    AddressRepository _addressRepository = AddressRepository();

    if (checkValid()) {
      print("주소 입력 똑바로 해주세요");
    } else {
      try {
        final response = await _addressRepository.makeAddress(AddressModel(
            address: addressController.text,
            postCode: zipCodeController.text,
            detailedAddress: detailAddress,
            addressName: "집",
            isDefault: true));

        if (!response.success) {
          ErrorHandler.errorHandler(response.message);
        } else {
          Get.back();
        }
      } catch (e) {
        ErrorHandler.errorHandler("defalt");
        print(e);
      }
    }
  }
}
