class PaymentModel {
  String id;
  num amount;
  DateTime paymentDate;
  bool paymentComplete;
  bool rewardComplete;
  bool paymentFailure;
  String failureReason;
  String paidCardVendor;
  String paidCardNumber;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentModel(
      {this.id,
      this.amount,
      this.paymentDate,
      this.paymentComplete,
      this.rewardComplete,
      this.paymentFailure,
      this.failureReason,
      this.paidCardVendor,
      this.paidCardNumber,
      this.createdAt,
      this.updatedAt});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    paymentDate = DateTime.parse(json['paymentDate']);
    paymentComplete = json['paymentComplete'];
    rewardComplete = json['rewardComplete'];
    paymentFailure = json['paymentFailure'];
    failureReason = json['failureReason'];
    paidCardNumber = json['paidCardNumber'];
    paidCardVendor = json['paidCardVendor'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }
}
