class Response {
  Data data;

  Response({this.data});

  Response.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String email;
  String provider;
  String fullName;
  String uid;
  bool allowPasswordChange;

  Data(
      {this.id,
      this.email,
      this.provider,
      this.fullName,
      this.uid,
      this.allowPasswordChange});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    provider = json['provider'];
    fullName = json['full_name'];
    uid = json['uid'];
    allowPasswordChange = json['allow_password_change'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['full_name'] = this.fullName;
    data['uid'] = this.uid;
    data['allow_password_change'] = this.allowPasswordChange;
    return data;
  }
}
