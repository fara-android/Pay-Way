class UserModel {
  User? user;

  UserModel({this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? country;

  int? status;
  int? emailVerified;
  int? kycStatus;
  List<String>? kycText;
  String? createdAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.country,
      this.status,
      this.emailVerified,
      this.kycStatus,
      this.kycText,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    status = json['status'];
    emailVerified = json['email_verified'];
    kycStatus = json['kyc_status'];
    if (json['kyc_text'] != null) {
      kycText = json['kyc_text'].cast<String>();
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
    data['status'] = this.status;
    data['email_verified'] = this.emailVerified;
    data['kyc_status'] = this.kycStatus;
    data['kyc_text'] = this.kycText;
    data['created_at'] = this.createdAt;
    return data;
  }
}
