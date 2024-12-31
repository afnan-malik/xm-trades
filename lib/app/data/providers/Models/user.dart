class UserDetails {
  String? status;
  String? token;
  User? user;

  UserDetails({this.status, this.token, this.user});

  UserDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fname;
  Null? lname;
  String? phoneno;
  String? profileimage;

  User({this.id, this.fname, this.lname, this.phoneno, this.profileimage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    phoneno = json['phoneno'];
    profileimage = json['profileimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phoneno'] = this.phoneno;
    data['profileimage'] = this.profileimage;
    return data;
  }
}
