import 'package:get/get.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/model/user_card_model.dart';
import 'package:subping/model/user_model.dart';
import 'package:subping/repository/user_repository.dart';

class UserViewModel extends GetxController {
  UserRepository _userRepository = UserRepository();

  Rx<UserModel> _user = UserModel().obs;
  RxMap<String, UserAddressModel> _addresses = <String, UserAddressModel>{}.obs;
  RxMap<String, UserCardModel> _cards = <String, UserCardModel>{}.obs;

  Future<void> updateInfo() async {
    _user.value.updateUserModel(await _userRepository.getUser());
    _user.refresh();
    await updateUserAddresses();

    this.checkUserStatus();
  }

  Future<void> updateUserAddresses() async {
    final response = await _userRepository.getUserAddresses();
    _addresses.value = {};

    response.forEach((element) {
      _addresses[element.id] = element;
    });

    _addresses.refresh();
  }

  Future<void> updateUserCards() async {
    final response = await _userRepository.getUserCards();
    _cards.value = {};

    response.forEach((element) {
      _cards[element.id] = element;
    });

    _cards.refresh();
  }
  
  Future<void> deleteCard(UserCardModel card) async {
    final response = await _userRepository.deleteCard(card.id);

    if(response) {
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
    return _cards.value;
  }

  Map<String, UserAddressModel> get userAddreses {
    return _addresses;
  }
}
