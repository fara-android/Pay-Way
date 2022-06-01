class HistoryPaymentModel {
  List<Data>? data;

  HistoryPaymentModel({this.data});

  HistoryPaymentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? trnx;
  int? userId;
  int? userType;
  int? walletId;
  Currency? currency;
  double? charge;
  num? amount;
  String? remark;
  String? type;
  User? user;
  String? details;
  num? invoiceNum;
  String? createdAt;

  Data(
      {this.id,
      this.trnx,
      this.userId,
      this.userType,
      this.walletId,
      this.currency,
      this.charge,
      this.amount,
      this.remark,
      this.type,
      this.details,
      this.user,
      this.invoiceNum,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trnx = json['trnx'];
    userId = json['user_id'];
    userType = json['user_type'];
    walletId = json['wallet_id'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    charge = json['charge'];
    amount = json['amount'];
    remark = json['remark'];
    type = json['type'];
    details = json['details'];
    invoiceNum = json['invoice_num'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trnx'] = trnx;
    data['user_id'] = userId;
    data['user_type'] = userType;
    data['wallet_id'] = walletId;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    data['charge'] = charge;
    data['amount'] = amount;
    data['remark'] = remark;
    data['type'] = type;
    data['details'] = details;
    data['invoice_num'] = invoiceNum;
    data['created_at'] = createdAt;
    return data;
  }
}

class Currency {
  int? id;
  String? symbol;
  String? code;
  String? currName;
  int? type;
  int? status;
  String? rate;

  Currency(
      {this.id,
      this.symbol,
      this.code,
      this.currName,
      this.type,
      this.status,
      this.rate});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    code = json['code'];
    currName = json['curr_name'];
    type = json['type'];
    status = json['status'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['code'] = code;
    data['curr_name'] = currName;
    data['type'] = type;
    data['status'] = status;
    data['rate'] = rate;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? country;
  String? address;
  int? status;
  int? emailVerified;
  int? kycStatus;
  String? createdAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.country,
      this.address,
      this.status,
      this.emailVerified,
      this.kycStatus,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    address = json['address'];
    status = json['status'];
    emailVerified = json['email_verified'];
    kycStatus = json['kyc_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['address'] = this.address;
    data['status'] = this.status;
    data['email_verified'] = this.emailVerified;
    data['kyc_status'] = this.kycStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
