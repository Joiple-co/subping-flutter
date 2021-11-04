class UserAddressModel {
  String id;
  String userName;
  String userPhoneNumber;
  String postCode;
  String address;
  String detailedAddress;
  bool isDefault;
  String createdAt;

  UserAddressModel(
      {this.id,
      this.userName,
      this.userPhoneNumber,
      this.postCode,
      this.address,
      this.detailedAddress,
      this.isDefault,
      this.createdAt});

  void updateUserModel(UserAddressModel userAddress) {
    id = userAddress.id ?? id;
    userName = userAddress.userName ?? userName;
    userPhoneNumber = userAddress.userPhoneNumber ?? userPhoneNumber;
    postCode = userAddress.postCode ?? postCode;
    address = userAddress.address ?? address;
    detailedAddress = userAddress.detailedAddress ?? detailedAddress;
    isDefault = userAddress.isDefault ?? isDefault;
    createdAt = userAddress.createdAt ?? createdAt;
  }

  bool isSame(UserAddressModel userAddress) {
    if (userName == userAddress.userName &&
        userPhoneNumber == userAddress.userPhoneNumber &&
        postCode == userAddress.postCode &&
        address == userAddress.address &&
        detailedAddress == userAddress.detailedAddress &&
        isDefault == userAddress.isDefault) {
      return true;
    } else {
      return false;
    }
  }

  UserAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    userPhoneNumber = json['userPhoneNumber'];
    postCode = json['postCode'];
    address = json['address'];
    detailedAddress = json['detailedAddress'];
    isDefault = json['isDefault'] == 1 ? true : false;
    createdAt = json['createdAt'];
  }
}
