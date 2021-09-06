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
    id = userAddress.id ?? this.id;
    userName = userAddress.userName ?? this.userName;
    userPhoneNumber = userAddress.userPhoneNumber ?? this.userPhoneNumber;
    postCode = userAddress.postCode ?? this.postCode;
    address = userAddress.address ?? this.address;
    detailedAddress = userAddress.detailedAddress ?? this.detailedAddress;
    isDefault = userAddress.isDefault ?? this.isDefault;
    createdAt = userAddress.createdAt ?? this.createdAt;
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
 