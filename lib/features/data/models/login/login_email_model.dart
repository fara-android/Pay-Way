class LoginEmailModel {
  User? user;
  String? tokenType;
  String? token;
  String? expiresAt;

  LoginEmailModel({this.user, this.tokenType, this.token, this.expiresAt});

  LoginEmailModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tokenType = json['token_type'];
    token = json['token'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token_type'] = this.tokenType;
    data['token'] = this.token;
    data['expires_at'] = this.expiresAt;
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
  List<Wallets>? wallets;
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
      this.wallets,
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
    if (json['wallets'] != null) {
      wallets = <Wallets>[];
      json['wallets'].forEach((v) {
        wallets!.add(new Wallets.fromJson(v));
      });
    }
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
    if (this.wallets != null) {
      data['wallets'] = this.wallets!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
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
