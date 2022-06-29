import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/widgets/login-sign_up/info_box.dart';
import 'package:front_end/widgets/login-sign_up/login_container.dart';

class LoginEmployee extends StatefulWidget {
  const LoginEmployee({Key? key}) : super(key: key);

  @override
  State<LoginEmployee> createState() => _LoginEmployeeState();
}

class _LoginEmployeeState extends State<LoginEmployee> {
  Constants constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          infoBoxWidget(context),
          loginContainer(context),
        ],
      ),
    );
  }
}
