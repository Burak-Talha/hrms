// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login/login_screen_employee.dart';
import 'register_screen_boss.dart';
import 'package:http/http.dart' as http;

class RegisterScreenEmployee extends StatefulWidget {
  const RegisterScreenEmployee({Key? key}) : super(key: key);

  @override
  _RegisterScreenEmployeeState createState() => _RegisterScreenEmployeeState();
}

var name;
var surname;
var mail;
var tc;
var password;
var birthy;

class _RegisterScreenEmployeeState extends State<RegisterScreenEmployee> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(
              left: 40.0, right: 40.0, top: 20, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 44, 43, 43),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(
              children: [
                SizedBox(height: 50),
                Center(
                    child: Text(
                  "HRMS - Kayıt",
                  style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style: GoogleFonts.varelaRound(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60)))),
                    maxLines: 1,
                    onFieldSubmitted: (value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60)))),
                    onFieldSubmitted: (value) {
                      surname = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60)))),
                    onFieldSubmitted: (value) {
                      mail = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60)))),
                    onFieldSubmitted: (value) {
                      password = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Icon(
                            Icons.assignment_ind_rounded,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60)))),
                    onFieldSubmitted: (value) {
                      birthy = value;
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, bottom: 50, left: 110),
                      child: ElevatedButton(
                        child: Text("Kayıt Ol"),
                        onPressed: () {
                          print(
                              "İsim: $name Soyisim: $surname Mail: $mail Şifre: $password Doğum Yılı: $birthy");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreenEmployee()),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, bottom: 50, left: 40),
                      child: ElevatedButton(
                        child: Text("Geri"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreenEmployee()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreenBoss()),
                        )),
                    child: Text("Şirket Hesabı Açmak Mı İstiyorsun?"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String url = "http://localhost:8080/register";

Future save() async {
  var res = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'mail': mail, 'password': password}));
  print(res.body);
  if (res.body != null) {
    print("No problem!");
  }
}
