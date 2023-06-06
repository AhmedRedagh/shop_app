class LoginModel {
  bool? status;
  String? message;
  UserData? data;
  LoginModel(
    this.data,
    this.status,
    this.message,
  );

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    credit = json['credit'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    points = json['points'];
    token = json['token'];
  }
}
