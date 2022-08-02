class SignUpModel {
  int? id;
  String? corporationName;
  String? webSiteName;
  String? email;
  String? password;

  SignUpModel(
      {this.id,
      this.corporationName,
      this.webSiteName,
      this.email,
      this.password});

  SignUpModel.fromJson(Map<String, dynamic> json) {
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
