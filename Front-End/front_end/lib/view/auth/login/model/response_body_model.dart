class LoginResponseBodyModel {
  bool? success;
  String? message;
  LoginData? data;

  LoginResponseBodyModel({this.success, this.message, this.data});

  LoginResponseBodyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? id;
  String? corporationName;
  String? webSiteName;
  String? email;
  String? password;

  LoginData(
      {this.id,
      this.corporationName,
      this.webSiteName,
      this.email,
      this.password});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    corporationName = json['corporationName'];
    webSiteName = json['webSiteName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['corporationName'] = corporationName;
    data['webSiteName'] = webSiteName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
