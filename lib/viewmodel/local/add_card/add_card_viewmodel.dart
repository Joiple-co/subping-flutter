import 'package:get/get.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/user_repository.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

enum AddCardStep { cardName, pg, loading, done }

class AddCardViewModel extends GetxController {
  final Rx<AddCardStep> _step = AddCardStep.cardName.obs;
  final RxBool _available = false.obs;
  final RxString _cardName = "".obs;
  final UserRepository _userRepository = UserRepository();

  void onChangeCardName(String cardName) {
    _cardName.value = cardName;

    if (_cardName.value.isNotEmpty) {
      _available.value = true;
    } else {
      _available.value = false;
    }
  }

  void onClickCardNameDone() {
    if (_available.value) {
      _step.value = AddCardStep.pg;
    }
  }

  Future<void> onAddCardDone(Map<String, String> result) async {
    _step.value = AddCardStep.loading;

    final success = result["success"];
    final cardVendor = result["card_name"];
    final billingKey = result["customer_uid"];
    final method = result["pay_method"];
    final pg = result["pg_provider"];

    if (success == "true") {
      await _userRepository.addCard(
          cardVendor, billingKey, method, pg, _cardName.value);
      final userViewModel = Get.find<UserViewModel>();
      await userViewModel.updateUserCards();

      Get.back();
      _step.value = AddCardStep.done;
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
