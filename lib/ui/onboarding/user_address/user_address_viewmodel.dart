import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';
import 'package:page_transition/page_transition.dart';

class UserAddressViewModel with ChangeNotifier {
  FocusNode detailedAddressFocusNode = FocusNode();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String postCode;
  String address;
  String detailedAddress;

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
}
