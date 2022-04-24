// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:fusion_ui/constants/constants.dart';
import 'package:fusion_ui/theme-style/colors.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(title: Text(homeConstants().title)),
          bottomNavigationBar: bottomNavigateBarWidget(),
          body: myBody(),
        ));
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
        Spacer(flex: 3),
        mailInput(),
        passwordInput(),
        loginButton(),
        Spacer(flex: 7),
      ],
    );
  }
}

class loginButton extends StatelessWidget {
  const loginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {}, child: Text(homeConstants().loginButtonT));
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
              icon: Icon(Icons.mail_outline_sharp),
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
                    icon: Icon(Icons.password_sharp)),
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
          icon: Icon(Icons.login_sharp), label: homeConstants().loginT),
      BottomNavigationBarItem(
          icon: Icon(Icons.app_registration_sharp),
          label: homeConstants().registerT),
    ]);
  }
}

class titleText extends StatelessWidget {
  const titleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(homeConstants().title);
  }
}
