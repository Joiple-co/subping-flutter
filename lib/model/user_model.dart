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
    email = user.email ?? this.email;
    name = user.name ?? this.name;
    nickName = user.nickName ?? this.nickName;
    userProfileImageUrl = user.userProfileImageUrl ?? this.userProfileImageUrl;
    birthday = user.birthday ?? this.birthday;
    gender = user.gender ?? this.gender;
    ci = user.ci ?? this.ci;
    carrier = user.carrier ?? this.carrier;
    phoneNumber = user.phoneNumber ?? this.phoneNumber;
    createdAt = user.createdAt ?? this.createdAt;
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
