class UserRegister {
  String? phoneno;
  String? email;
  String? fname;
  String? password;
  String? passwordConfirmation;
  String? referralCode;
  String? deviceId;

  UserRegister(
      {this.phoneno,
        this.email,
        this.fname,
        this.password,
        this.passwordConfirmation,
        this.referralCode,
        this.deviceId});

  UserRegister.fromJson(Map<String, dynamic> json) {
    phoneno = json['phoneno'];
    email = json['email'];
    fname = json['fname'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    referralCode = json['referral_code'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneno'] = this.phoneno;
    data['email'] = this.email;
    data['fname'] = this.fname;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    data['referral_code'] = this.referralCode;
    data['device_id'] = this.deviceId;
    return data;
  }
}
