// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/func/post_data.dart';
import 'package:front_end/pages/login/login_employee.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';
import 'package:front_end/widgets/content/info_box.dart';
import 'package:front_end/widgets/content/snack_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
          infoBoxWidget(context, constants),
          signUpContainer(context),
        ],
      ),
    );
  }

  Expanded signUpContainer(BuildContext context) {
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
            nameRow(context),
            const Spacer(),
            surnameRow(context),
            const Spacer(),
            mailRow(context),
            const Spacer(),
            passwordRow(context),
            const Spacer(),
            signUpButton(),
            loginButton(context),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  CupertinoButton loginButton(BuildContext context) {
    return CupertinoButton(
        child: Text(constants.loginButton),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginEmployee()),
          );
        });
  }

  ElevatedButton signUpButton() {
    return ElevatedButton(
      style: const ButtonStyle(),
      onPressed: () {
        signUpFunction();
      },
      child: Text(
        constants.signUp,
        style: GoogleFonts.jost(
          textStyle: ProjectStyles.containerTextStyle
              .copyWith(fontSize: 20, letterSpacing: 0),
        ),
      ),
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
          employee.password = value;
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
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Center(
                child: emailInput(),
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

  TextField emailInput() {
    return TextField(
      onChanged: (value) {
        setState(() {
          employee.email = value;
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
    );
  }

  Expanded surnameRow(BuildContext context) {
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
                child: surnameInput(),
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

  TextField surnameInput() {
    return TextField(
      onChanged: (value) {
        setState(() {
          employee.surname = value;
        });
      },
      style: GoogleFonts.jost(
        textStyle: ProjectStyles.labelTextStyle.copyWith(fontSize: 20),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: const Icon(Icons.person_rounded),
        hintText: constants.surname,
      ),
    );
  }

  Expanded nameRow(BuildContext context) {
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
                child: nameInput(),
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

  TextField nameInput() {
    return TextField(
      onChanged: (value) {
        setState(() {
          employee.name = value;
        });
      },
      style: GoogleFonts.jost(
        textStyle: ProjectStyles.labelTextStyle.copyWith(fontSize: 20),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: const Icon(Icons.person_rounded),
        hintText: constants.name,
      ),
    );
  }

  void signUpFunction() {
    print("name: ${employee.name}");
    print("surname: ${employee.surname}");
    print("email: ${employee.email}");
    print("password: ${employee.password}");
    if (postDataSignUpEmployee() == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginEmployee(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, constants.signUpFailed),
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
