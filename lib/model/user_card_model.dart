class UserCardModel {
  String id;
  String user;
  String cardName;
  String cardVendor;
  String method;

  UserCardModel({
    this.id,
    this.user,
    this.cardName,
    this.cardVendor,
    this.method
  });

  UserCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    cardName = json['cardName'];
    cardVendor = json['cardVendor'];
    method = json['method'];
  }
}
 