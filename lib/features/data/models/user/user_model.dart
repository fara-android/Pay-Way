class UserModel {
  Data? data;

  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['user'] != null ? new Data.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['user'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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

class Transactions {
  int? id;
  String? trnx;
  int? userId;
  int? userType;
  int? walletId;
  Currency? currency;
  num? charge;
  num? amount;
  String? remark;
  String? type;
  String? details;
  String? createdAt;

  Transactions({
    this.id,
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
    this.createdAt,
  });

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trnx = json['trnx'];
    userId = json['user_id'];
    userType = json['user_type'];
    walletId = json['wallet_id'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    charge = json['charge'];
    amount = json['amount'];
    remark = json['remark'];
    type = json['type'];
    details = json['details'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trnx'] = this.trnx;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['wallet_id'] = this.walletId;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    data['charge'] = this.charge;
    data['amount'] = this.amount;
    data['remark'] = this.remark;
    data['type'] = this.type;
    data['details'] = this.details;
    data['created_at'] = this.createdAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['code'] = this.code;
    data['curr_name'] = this.currName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['rate'] = this.rate;
    return data;
  }
}

class Wallets {
  int? id;
  double? balance;
  Currency? currency;
  String? createdAt;

  Wallets({this.id, this.balance, this.currency, this.createdAt});

  Wallets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['balance'] = this.balance;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}
