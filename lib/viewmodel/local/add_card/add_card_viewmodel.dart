import 'dart:convert';

import 'package:get/get.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/user_repository.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

enum AddCardStep {
  CARD_NAME,
  PG
}

class AddCardViewModel extends GetxController {
  Rx<AddCardStep> _step = AddCardStep.CARD_NAME.obs;
  RxBool _available = false.obs;
  RxString _cardName = "".obs;
  UserRepository _userRepository = UserRepository();

  void onChangeCardName(String cardName) {
    _cardName.value = cardName;

    if(_cardName.value.length > 0) {
      _available.value = true;
    } else {
      _available.value = false;
    }
  }

  void onClickCardNameDone() {
    if(_available.value) {
      _step.value = AddCardStep.PG;
    }
  }

  Future<void> onAddCardDone(Map<String, String> result) async {
    final success = result["success"];
    final cardVendor = result["card_name"];
    final billingKey = result["customer_uid"];
    final method = result["pay_method"];
    final pg = result["pg_provider"];

    if(success == "true"){
      Get.back();
      await _userRepository.addCard(cardVendor, billingKey, method, pg, _cardName.value);
      final userViewModel = Get.find<UserViewModel>();
      await userViewModel.updateUserCards();
    } else {
      Get.back();
      ErrorHandler.errorHandler("AddCardException");
    }
  }

  AddCardStep get step {
    return _step.value;
  }

  bool get available {
    return _available.value;
  }
}
