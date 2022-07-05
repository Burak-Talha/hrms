// ignore_for_file: avoid_print, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/func/post_data.dart';
import 'package:front_end/pages/home/home_employee.dart';
import 'package:front_end/pages/sign_up/sign_up_employee.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';
import 'package:front_end/widgets/content/snack_bar.dart';
import 'package:front_end/widgets/content/info_box.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginEmployee extends StatefulWidget {
  const LoginEmployee({Key? key}) : super(key: key);

  @override
  State<LoginEmployee> createState() => _LoginEmployeeState();
}

class _LoginEmployeeState extends State<LoginEmployee> {
  Constants constants = Constants();

  bool passwordObsecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          infoBoxWidget(context, constants),
          loginContainer(context),
        ],
      ),
    );
  }

  Expanded loginContainer(BuildContext context) {
    return Expanded(
      child: Container(
        width: context.dynamicWidth(0.4),
        height: context.dynamicHeight(1),
        decoration: BoxDecoration(
          color: ProjectColors.loginContainerColor,
        ),
        child: Column(
          children: [
            const Spacer(flex: 3),
            mailRow(context),
            const Spacer(),
            passwordRow(context),
            const Spacer(),
            loginButton(),
            signUpButton(context),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  CupertinoButton signUpButton(BuildContext context) {
    return CupertinoButton(
        child: Text(constants.signUpLabelText),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpEmployee(),
            ),
          );
        });
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      style: const ButtonStyle(),
      onPressed: () {
        loginFunction();
      },
      child: Text(constants.login,
          style: GoogleFonts.jost(
            textStyle: ProjectStyles.containerTextStyle
                .copyWith(fontSize: 20, letterSpacing: 0),
          )),
    );
  }

  Expanded passwordRow(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Spacer(
            flex: 2,
          ),
          Container(
            width: context.dynamicWidth(0.3),
            height: context.dynamicHeight(0.07),
            decoration: BoxDecoration(
              color: ProjectColors.whiteColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Center(
                child: passwordInput(),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  TextField passwordInput() {
    return TextField(
      obscureText: passwordObsecured,
      onChanged: (value) {
        setState(() {
          employee.setPassword(value);
        });
      },
      style: GoogleFonts.jost(
        textStyle: ProjectStyles.labelTextStyle.copyWith(fontSize: 20),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: const Icon(Icons.key_rounded),
        hintText: constants.password,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordObsecured = !passwordObsecured;
            });
          },
          icon: Icon(
            passwordObsecured
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
        ),
      ),
    );
  }

  Expanded mailRow(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Spacer(
            flex: 2,
          ),
          Container(
            width: context.dynamicWidth(0.3),
            height: context.dynamicHeight(0.07),
            decoration: BoxDecoration(
              color: ProjectColors.whiteColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: mailInput(constants),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  Padding mailInput(constants) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Center(
        child: TextField(
          onChanged: (value) {
            setState(() {
              employee.setEmail(value);
            });
          },
          style: GoogleFonts.jost(
            textStyle: ProjectStyles.labelTextStyle.copyWith(fontSize: 20),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.mail_rounded),
            hintText: constants.email,
          ),
        ),
      ),
    );
  }

  void loginFunction() async {
    print("email: ${employee.email}");
    print("password: ${employee.password}");
    if (await postDataLoginEmployee() == "true") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeEmployee(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, constants.loginFailed),
      );
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => super.widget,
          transitionDuration: const Duration(seconds: 0),
        ),
      );
    }
  }
}
