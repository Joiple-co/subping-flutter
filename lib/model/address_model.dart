class AddressModel {
  String addressName;
  String postCode;
  String address;
  String detailedAddress;
  bool isDefault;

  AddressModel(
      {this.postCode,
      this.address,
      this.addressName,
      this.detailedAddress,
      this.isDefault});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressName = json['addressName'];
    postCode = json['postCode'];
    address = json['address'];
    detailedAddress = json['detailedAddress'];
    isDefault = json['isDefault'];
  }
}
