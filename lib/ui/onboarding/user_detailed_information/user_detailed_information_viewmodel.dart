import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';
import 'package:subping/enum/enum.dart';
import 'package:page_transition/page_transition.dart';

class UserDetailedInformationViewModel with ChangeNotifier {
  final stepWords = {
    OnboardingStep.ONBOARDING_EMAIL: "이메일 주소",
    OnboardingStep.ONBOARDING_ADDRESS: "주소"
  };

  String email;
  String postCode;
  String address;
  String detailedAddress;
  String emailErrorMessage;

  OnboardingStep step;

  UserDetailedInformationViewModel() {
    email = "";
    postCode = "";
    address = "";
    detailedAddress = "";
    emailErrorMessage = null;
    step = OnboardingStep.ONBOARDING_EMAIL;
  }

  void onPressEndEmail(
      emailMoveAnimationController, addressFadeAnimationController) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (emailValid) {
      emailMoveAnimationController.forward();
      new Future.delayed(const Duration(milliseconds: 200), () {
        step = OnboardingStep.ONBOARDING_ADDRESS;
        addressFadeAnimationController.forward();
      });
    } else {
      emailErrorMessage = "이메일 주소를 양식에 맞게 입력해주세요.";
    }
    notifyListeners();
  }

  void onPressEndAddress() {}

  void onPressFindPostCode(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.bottomToTop,
            child: Kopo(callback: onFindPostCode)));
  }

  void onChangeEmail(text) {
    email = text;
    emailErrorMessage = null;
    notifyListeners();
  }

  void onChangeDetailedAddress(text) {
    detailedAddress = text;
    notifyListeners();
  }

  void onFindPostCode(KopoModel kopoModel, FocusNode detailedAddressNode) {
    address = kopoModel.address;
    postCode = kopoModel.zonecode;
    notifyListeners();

    detailedAddressNode.requestFocus();
  }

  bool buttonDisabled() {
    if (step == OnboardingStep.ONBOARDING_EMAIL) {
      return email.length == 0;
    } else {
      return postCode.length == 0 ||
          address.length == 0 ||
          detailedAddress.length == 0;
    }
  }
}
