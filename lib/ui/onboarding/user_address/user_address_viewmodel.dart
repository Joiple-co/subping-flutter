import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';
import 'package:page_transition/page_transition.dart';
import 'package:subping/model/address_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/address_repository.dart';

class UserAddressViewModel with ChangeNotifier {
  FocusNode detailedAddressFocusNode = FocusNode();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String postCode = "123";
  String address = "123";
  String detailedAddress = "123";

  void onPressFindPostCode(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.bottomToTop,
            child:
                Kopo(callback: (kopoModel) => this.onFindPostCode(kopoModel))));
  }

  void onFindPostCode(KopoModel kopoModel) {
    postCode = kopoModel.zonecode;
    address = kopoModel.address;

    postCodeController.text = kopoModel.zonecode;
    addressController.text = kopoModel.address;

    detailedAddressFocusNode.requestFocus();
    notifyListeners();
  }

  void onChangeDetailedAddress(String text) {
    detailedAddress = text;
    notifyListeners();
  }

  void onSubmit(BuildContext context) async {
    try {
      final address = AddressModel(
          postCode: this.postCode,
          address: this.address,
          detailedAddress: this.detailedAddress,
          addressName: "기본",
          isDefault: true);

      final addressRepository = AddressRepository();
      final response = await addressRepository.makeAddress(address);

      if (!response.success) {
        ErrorHandler.errorHandler(context, response.message);
      } else {
        Navigator.pushReplacementNamed(context, "/home");
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler(context, "defalt");
    }
  }

  bool buttonDisabled() {
    return !(postCode.length != 0 &&
        address.length != 0 &&
        detailedAddress.length != 0);
  }
}
