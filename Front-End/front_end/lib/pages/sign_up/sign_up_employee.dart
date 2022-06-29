import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/widgets/login-sign_up/info_box.dart';
import 'package:front_end/widgets/login-sign_up/sign_up_container.dart';

class SignUpEmployee extends StatefulWidget {
  const SignUpEmployee({Key? key}) : super(key: key);

  @override
  State<SignUpEmployee> createState() => _SignUpEmployeeState();
}

class _SignUpEmployeeState extends State<SignUpEmployee> {
  Constants constants = Constants();

  bool passwordObsecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          infoBoxWidget(context),
          signUpContainer(context),
        ],
      ),
    );
  }
}
