import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/data/employee/employee.dart';
import 'package:front_end/func/post_data.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeSignUp extends StatefulWidget {
  const EmployeeSignUp({Key? key}) : super(key: key);

  @override
  State<EmployeeSignUp> createState() => _EmployeeSignUpState();
}

class _EmployeeSignUpState extends State<EmployeeSignUp> {
  Constants constants = Constants();
  Emlpoyee employee = Emlpoyee();

  bool passwordObsecured = true;

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

  //----------------------------------------------------------------------------

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
                    child: Text(constants.name,
                        style: GoogleFonts.jost(
                          textStyle: ProjectStyles.labelTextStyle
                              .copyWith(fontSize: 20),
                        )),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) => employee.name = value,
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
                    child: Text(constants.surname,
                        style: GoogleFonts.jost(
                          textStyle: ProjectStyles.labelTextStyle
                              .copyWith(fontSize: 20),
                        )),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) => employee.surname = value,
                      obscureText: passwordObsecured,
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
                      onChanged: (value) => employee.email = value,
                      obscureText: passwordObsecured,
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
                      onChanged: (value) => employee.password = value,
                      obscureText: passwordObsecured,
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
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: postDataSignUpEmployee,
              child: Text(constants.signUp,
                  style: GoogleFonts.jost(
                    textStyle: ProjectStyles.containerTextStyle
                        .copyWith(fontSize: 20, letterSpacing: 0),
                  )),
            ),
            CupertinoButton(
                child: Text(constants.loginButton), onPressed: () {}),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Padding infoBoxWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        width: context.dynamicWidth(0.4),
        height: context.dynamicHeight(0.9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ProjectColors.infoContainerColor,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  constants.title,
                  style: GoogleFonts.jost(
                    textStyle:
                        ProjectStyles.containerTextStyle.copyWith(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                constants.signUpInfo,
                style: GoogleFonts.jost(
                    textStyle: ProjectStyles.containerTextStyle
                        .copyWith(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
