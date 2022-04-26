// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:fusion_ui/constants/constants.dart';
import 'package:fusion_ui/pages/register/register_b.dart';
import 'package:fusion_ui/theme-style/colors.dart';

class LoginB extends StatefulWidget {
  const LoginB({Key? key}) : super(key: key);

  @override
  State<LoginB> createState() => _LoginBState();
}

class _LoginBState extends State<LoginB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(homeConstants().titleJobSeekerLoginT)),
        bottomNavigationBar: bottomNavigateBarWidget(),
        body: myBody());
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
        iconHome(),
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

class iconHome extends StatelessWidget {
  const iconHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.corporate_fare_rounded);
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
        signUpButton(),
        Spacer(
          flex: 3,
        ),
      ],
    );
  }
}

class signUpButton extends StatelessWidget {
  const signUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => RegisterB(),
            ),
          );
        },
        child: Text(homeConstants().signupT));
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
          label: homeConstants().jobSeekerT),
    ]);
  }
}

class titleText extends StatelessWidget {
  const titleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(homeConstants().titleEmployeeLoginT);
  }
}
