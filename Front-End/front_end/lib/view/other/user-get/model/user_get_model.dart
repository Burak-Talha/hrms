// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class UserModel {
  List<DataList>? dataList;

  UserModel({this.dataList});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['dataList'] != null) {
      dataList = <DataList>[];
      json['dataList'].forEach((v) {
        dataList!.add(new DataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataList != null) {
      data['dataList'] = this.dataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  int? id;
  String? corporationName;
  String? webSiteName;
  String? email;
  String? password;

  DataList({
    this.id,
    this.corporationName,
    this.webSiteName,
    this.email,
    this.password,
  });

  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    corporationName = json['corporationName'];
    webSiteName = json['webSiteName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['corporationName'] = this.corporationName;
    data['webSiteName'] = this.webSiteName;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}
