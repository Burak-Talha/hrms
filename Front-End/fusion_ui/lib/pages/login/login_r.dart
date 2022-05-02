// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fusion_ui/constants/constants.dart';
import 'package:fusion_ui/pages/register/register_r.dart';

class LoginR extends StatefulWidget {
  const LoginR({Key? key}) : super(key: key);

  @override
  State<LoginR> createState() => _LoginRState();
}

class _LoginRState extends State<LoginR> {
  var mail;
  var password;

  final _key = GlobalKey<FormState>();
  /*User user = User("", "");
  String url = "http://localhost:8080/login";
  Future save() async {
    await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.mail, 'password': user.password}));
    print(res.body);
  }*/

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
                        onChanged: (value) {
                          mail = value;
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
                        onChanged: (value) {
                          password = value;
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
                    print('Mail: $mail Şifre: $password');
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
