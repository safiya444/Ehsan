class LoginAndRegister_Info {
  String? email;
  String? username;
  String? phone;
  bool? isAdmin;
  String? sId;
  int? iV;
  String? token;

  LoginAndRegister_Info(
      {this.email,
      this.username,
      this.phone,
      this.isAdmin,
      this.sId,
      this.iV,
      this.token});

  LoginAndRegister_Info.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    isAdmin = json['isAdmin'];
    sId = json['_id'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['isAdmin'] = this.isAdmin;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    data['token'] = this.token;
    return data;
  }
}