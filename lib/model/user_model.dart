class UserModel {
  String email;
  String name;
  String nickName;
  String userProfileImageUrl;
  String birthday;
  String gender;
  String ci;
  String carrier;
  String phoneNumber;
  String createdAt;

  UserModel(
      {this.email = "",
      this.name = "사용자",
      this.nickName = "",
      this.userProfileImageUrl,
      this.birthday,
      this.gender,
      this.ci,
      this.carrier,
      this.phoneNumber,
      this.createdAt});

  void updateUserModel(UserModel user) {
    email = user.email ?? email;
    name = user.name ?? name;
    nickName = user.nickName ?? nickName;
    userProfileImageUrl = user.userProfileImageUrl ?? userProfileImageUrl;
    birthday = user.birthday ?? birthday;
    gender = user.gender ?? gender;
    ci = user.ci ?? ci;
    carrier = user.carrier ?? carrier;
    phoneNumber = user.phoneNumber ?? phoneNumber;
    createdAt = user.createdAt ?? createdAt;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    nickName = json['nickName'];
    userProfileImageUrl = json['userProfileImageUrl'];
    birthday = json['birthday'];
    gender = json['gender'];
    ci = json['ci'];
    carrier = json['carrier'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
  }
}
