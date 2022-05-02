// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fusion_ui/constants/constants.dart';
import 'package:fusion_ui/constants/data/user.dart';
import 'package:fusion_ui/hrms_entity/employee.dart';
import 'package:fusion_ui/pages/register/register_r.dart';
import 'package:http/http.dart' as http;

class LoginR extends StatefulWidget {
  const LoginR({Key? key}) : super(key: key);

  @override
  State<LoginR> createState() => _LoginRState();
}

Employee employee = Employee();
final _key = GlobalKey<FormState>();

class _LoginRState extends State<LoginR> {
  Uri uri = "http://localhost:8080/login" as Uri;

  Future save() async {
    var res = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': employee.getEmail(),
          'password': employee.getPassword()
        }));
    print("miyav");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homeConstants().titleEmployeerLoginT),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.person_rounded)),
              label: homeConstants().employeeT),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.corporate_fare_rounded)),
              label: homeConstants().employeerT),
        ],
      ),
      body: Form(
        key: _key,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(Icons.corporate_fare_rounded),
            const Spacer(flex: 7),
            Expanded(
              flex: 10,
              child: Expanded(
                flex: 12,
                child: Row(
                  children: [
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 10,
                      child: TextFormField(
                        onChanged: (mail) {
                          employee.setEmail(mail);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: homeConstants().mailT,
                          icon: const Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1)
                  ],
                ),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 12,
              child: Row(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 10,
                      child: TextFormField(
                        onChanged: (password) {
                          employee.setPassword(password);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: homeConstants().passwordT,
                            icon: const Icon(Icons.password_rounded)),
                      )),
                  const Spacer(flex: 1),
                ],
              ),
            ),
            const Spacer(flex: 1),
            Row(
              children: [
                const Spacer(flex: 3),
                ElevatedButton(
                  onPressed: () {
                    print('Mail: $employee.mail Şifre: $employee.password');
                    save();
                  },
                  child: Text(homeConstants().loginT),
                ),
                const Spacer(flex: 1),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const RegisterR(),
                      ),
                    );
                  },
                  child: Text(homeConstants().signupT),
                ),
                const Spacer(flex: 3),
              ],
            ),
            const Spacer(flex: 9),
          ],
        ),
      ),
    );
  }
}
