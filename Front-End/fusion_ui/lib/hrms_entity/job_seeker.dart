class JobSeeker {
  int id = 0;

  String name = '';

  String surname = '';

  String mail = '';

  String password = '';

  String tcNo = '';

  int birthYear = 0;

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getSurname() {
    return surname;
  }

  void setSurname(String surname) {
    this.surname = surname;
  }

  String getMail() {
    return mail;
  }

  void setMail(String mail) {
    this.mail = mail;
  }

  String getPassword() {
    return password;
  }

  void setPassword(String password) {
    this.password = password;
  }

  String getTcNo() {
    return tcNo;
  }

  void setTcNo(String tcNo) {
    this.tcNo = tcNo;
  }

  int getBirthYear() {
    return birthYear;
  }

  void setBirthYear(int birthYear) {
    this.birthYear = birthYear;
  }
}
