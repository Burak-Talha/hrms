// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:fusion_ui/constants/constants.dart';
import 'package:fusion_ui/constants/data/user.dart';
import 'package:fusion_ui/pages/register/register_j.dart';
import 'package:fusion_ui/theme-style/colors.dart';

import 'package:http/http.dart' as http;

class LoginJ extends StatefulWidget {
  const LoginJ({Key? key}) : super(key: key);

  @override
  State<LoginJ> createState() => _LoginJState();
}

class _LoginJState extends State<LoginJ> {
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
    final _key = GlobalKey<FormState>();
    User user = User("", "");
    /*String url = "http://localhost:8080/login";
    Future save() async {
      await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'email': user.mail, 'password': user.password}));
      print(res.body);
    }*/

    return Form(
      key: _key,
      child: Column(
        children: [
          iconHome(),
          Spacer(flex: 7),
          mailInput(user: user),
          Spacer(flex: 1),
          passwordInput(user: user),
          Spacer(flex: 1),
          buttons(user: user),
          Spacer(flex: 9),
        ],
      ),
    );
  }
}

class buttons extends StatelessWidget {
  buttons({Key? key, required this.user}) : super(key: key);

  User user = User("", "");

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        loginButton(
          user: user,
        ),
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

class loginButton extends StatelessWidget {
  loginButton({Key? key, required user}) : super(key: key);
  User user = User("", "");

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print(user.mail);
          print(user.password);
        },
        child: Text(homeConstants().loginT));
  }
}

class mailInput extends StatelessWidget {
  mailInput({
    Key? key,
    required this.user,
  }) : super(key: key);

  User user = User("", "");

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
                onChanged: (value) {
                  user.mail = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
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

class iconHome extends StatelessWidget {
  const iconHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.corporate_fare_rounded);
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
              builder: (BuildContext context) => RegisterJ(),
            ),
          );
        },
        child: Text(homeConstants().signupT));
  }
}

class passwordInput extends StatelessWidget {
  passwordInput({
    Key? key,
    required this.user,
  }) : super(key: key);

  User user = User("", "");

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
                onChanged: (value) {
                  user.password = value;
                },
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
