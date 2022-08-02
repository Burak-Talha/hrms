class GoogleLoginModel {
  bool? success;
  String? message;
  Data? data;

  GoogleLoginModel({this.success, this.message, this.data});

  GoogleLoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? corporationName;
  String? webSiteName;
  String? email;
  String? password;
  Null? lastModifiedDate;
  Null? createDate;

  Data(
      {this.id,
      this.corporationName,
      this.webSiteName,
      this.email,
      this.password,
      this.lastModifiedDate,
      this.createDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    corporationName = json['corporationName'];
    webSiteName = json['webSiteName'];
    email = json['email'];
    password = json['password'];
    lastModifiedDate = json['lastModifiedDate'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['corporationName'] = this.corporationName;
    data['webSiteName'] = this.webSiteName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['createDate'] = this.createDate;
    return data;
  }
}
