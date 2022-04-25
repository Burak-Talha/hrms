// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:fusion_ui/constants/constants.dart';
import 'package:fusion_ui/theme-style/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(homeConstants().titleEmployee),
      ),
      bottomNavigationBar: bottomNavigateBarWidget(),
      body: myBody(),
    );
  }
}

class myBody extends StatelessWidget {
  const myBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 7),
        mailInput(),
        Spacer(flex: 1),
        passwordInput(),
        Spacer(flex: 1),
        buttons(),
        Spacer(flex: 9),
      ],
    );
  }
}

class buttons extends StatelessWidget {
  const buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        loginButton(),
        Spacer(
          flex: 1,
        ),
        registerButton(),
        Spacer(
          flex: 3,
        ),
      ],
    );
  }
}

class registerButton extends StatelessWidget {
  const registerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {}, child: Text(homeConstants().signupT));
  }
}

class loginButton extends StatelessWidget {
  const loginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {}, child: Text(homeConstants().loginT));
  }
}

class mailInput extends StatelessWidget {
  const mailInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Row(
        children: [
          Spacer(flex: 1),
          Expanded(
            flex: 10,
            child: TextFormField(
                decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: homeConstants().mailT,
              icon: Icon(Icons.mail_outline_rounded),
            )),
          ),
          Spacer()
        ],
      ),
    );
  }
}

class passwordInput extends StatelessWidget {
  const passwordInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Row(
        children: [
          Spacer(flex: 1),
          Expanded(
              flex: 10,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: homeConstants().passwordT,
                    icon: Icon(Icons.password_rounded)),
              )),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}

class bottomNavigateBarWidget extends StatelessWidget {
  const bottomNavigateBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
          icon: IconButton(onPressed: () {}, icon: Icon(Icons.person_rounded)),
          label: homeConstants().employeeT),
      BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {}, icon: Icon(Icons.corporate_fare_rounded)),
          label: homeConstants().bossT),
    ]);
  }
}

class titleText extends StatelessWidget {
  const titleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(homeConstants().titleEmployee);
  }
}
