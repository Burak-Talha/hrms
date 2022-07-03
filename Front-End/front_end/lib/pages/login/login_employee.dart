// ignore_for_file: avoid_print, unrelated_type_equality_checks

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
            const Spacer(
              flex: 3,
            ),
            Expanded(
              child: Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(constants.email,
                        style: GoogleFonts.jost(
                          textStyle: ProjectStyles.labelTextStyle
                              .copyWith(fontSize: 20),
                        )),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          employee.email = value;
                        });
                      },
                      style: GoogleFonts.jost(
                        textStyle:
                            ProjectStyles.labelTextStyle.copyWith(fontSize: 20),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: ProjectColors.whiteColor,
                        hintStyle: TextStyle(
                          color: ProjectColors.labelColor,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              child: Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(constants.password,
                        style: GoogleFonts.jost(
                          textStyle: ProjectStyles.labelTextStyle
                              .copyWith(fontSize: 20),
                        )),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          employee.password = value;
                        });
                      },
                      obscureText: passwordObsecured,
                      style: GoogleFonts.jost(
                        textStyle:
                            ProjectStyles.labelTextStyle.copyWith(fontSize: 20),
                      ),
                      decoration: InputDecoration(
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
                        border: InputBorder.none,
                        filled: true,
                        fillColor: ProjectColors.whiteColor,
                        hintStyle: TextStyle(
                          color: ProjectColors.labelColor,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () {
                loginFunction();
              },
              child: Text(constants.login,
                  style: GoogleFonts.jost(
                    textStyle: ProjectStyles.containerTextStyle
                        .copyWith(fontSize: 20, letterSpacing: 0),
                  )),
            ),
            CupertinoButton(
                child: Text(constants.signUpLabelText),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpEmployee(),
                    ),
                  );
                }),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  void loginFunction() {
    print("email: ${employee.email}");
    print("password: ${employee.password}");
    if (postDataLoginEmployee() == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeEmployee(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context),
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
