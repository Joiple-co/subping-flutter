import 'package:get/get.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/model/user_card_model.dart';
import 'package:subping/model/user_model.dart';
import 'package:subping/repository/user_repository.dart';

class UserViewModel extends GetxController {
  final UserRepository _userRepository = UserRepository();

  final Rx<UserModel> _user = UserModel().obs;
  final RxMap<String, UserAddressModel> _addresses =
      <String, UserAddressModel>{}.obs;
  final RxMap<String, UserCardModel> _cards = <String, UserCardModel>{}.obs;

  Future<void> updateInfo() async {
    _user.value.updateUserModel(await _userRepository.getUser());
    _user.refresh();
    await updateUserAddresses();

    checkUserStatus();
  }

  Future<void> updateUserAddresses() async {
    final response = await _userRepository.getUserAddresses();
    _addresses.value = {};

    for (var element in response) {
      _addresses[element.id] = element;
    }

    _addresses.refresh();
  }

  Future<void> updateUserCards() async {
    final response = await _userRepository.getUserCards();
    _cards.value = {};

    for (var element in response) {
      _cards[element.id] = element;
    }

    _cards.refresh();
  }

  Future<void> deleteCard(UserCardModel card) async {
    final response = await _userRepository.deleteCard(card.id);

    if (response) {
      updateUserCards();
    }
  }

  void checkUserStatus() {
    if (_user.value.nickName == null || _user.value.nickName == "") {
      Get.offAndToNamed("/createNickName");
    }
  }

  String get name {
    return _user.value.name;
  }

  String get email {
    return _user.value.email;
  }

  String get nickName {
    return _user.value.nickName;
  }

  String get phoneNumber {
    return _user.value.phoneNumber;
  }

  String get userProfileImageUrl {
    return _user.value.userProfileImageUrl ?? "";
  }

  Map<String, UserCardModel> get cards {
    return _cards;
  }

  Map<String, UserAddressModel> get userAddreses {
    return _addresses;
  }
}
