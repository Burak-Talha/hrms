class Employee {
  int id = 00;

  String corporationName = '';

  String webSiteName = '';

  String email = '';

  String password = '';

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getCorporationName() {
    return corporationName;
  }

  void setCorporationName(String corporationName) {
    this.corporationName = corporationName;
  }

  String getWebSiteName() {
    return webSiteName;
  }

  void setWebSiteName(String webSiteName) {
    this.webSiteName = webSiteName;
  }

  String getEmail() {
    return email;
  }

  void setEmail(String email) {
    this.email = email;
  }

  String getPassword() {
    return password;
  }

  void setPassword(String password) {
    this.password = password;
  }
}
