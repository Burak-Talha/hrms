// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_ui/data/constants.dart';
import 'package:hrms_ui/pages/login.dart';
import 'package:hrms_ui/theme/colors.dart';
import 'package:hrms_ui/theme/styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Spacer(
            flex: 1,
          ),
          appBar(),
          const Spacer(
            flex: 5,
          ),
          Expanded(
            flex: 20,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Expanded(
                    flex: 9,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: SizedBox(
                        height: 600,
                        child: Column(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(ProjectConstants.signUp,
                                    style: GoogleFonts.poppins(
                                        textStyle:
                                            ProjectStyles.containerTitle)),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText: ProjectConstants.nameText,
                                          hintStyle: ProjectStyles.buttonText,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fillColor:
                                              ProjectColors.backgroundColor),
                                      style: GoogleFonts.poppins(
                                          textStyle: ProjectStyles.buttonText),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText:
                                              ProjectConstants.surnameText,
                                          hintStyle: ProjectStyles.buttonText,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fillColor:
                                              ProjectColors.backgroundColor),
                                      style: GoogleFonts.poppins(
                                          textStyle: ProjectStyles.buttonText),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 2,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText:
                                              ProjectConstants.passwordText,
                                          hintStyle: ProjectStyles.buttonText,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fillColor:
                                              ProjectColors.backgroundColor),
                                      style: GoogleFonts.poppins(
                                          textStyle: ProjectStyles.buttonText),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText: ProjectConstants.mailText,
                                          hintStyle: ProjectStyles.buttonText,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fillColor:
                                              ProjectColors.backgroundColor),
                                      style: GoogleFonts.poppins(
                                          textStyle: ProjectStyles.buttonText),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 2,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText: ProjectConstants.tcText,
                                          hintStyle: ProjectStyles.buttonText,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fillColor:
                                              ProjectColors.backgroundColor),
                                      style: GoogleFonts.poppins(
                                          textStyle: ProjectStyles.buttonText),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText:
                                              ProjectConstants.birthYearText,
                                          hintStyle: ProjectStyles.buttonText,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fillColor:
                                              ProjectColors.backgroundColor),
                                      style: GoogleFonts.poppins(
                                          textStyle: ProjectStyles.buttonText),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 2,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  ProjectConstants.signUp,
                                  style: GoogleFonts.poppins(
                                      textStyle: ProjectStyles.buttonText),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: ProjectColors.backgroundColor),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}

class appBar extends StatelessWidget {
  const appBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 1,
            child: Text(
              ProjectConstants.appBarTitle,
              style:
                  GoogleFonts.secularOne(textStyle: ProjectStyles.titleStyle),
              maxLines: 1,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Text(
                ProjectConstants.login,
                style: GoogleFonts.poppins(
                    textStyle: ProjectStyles.appBarTextStyle),
                maxLines: 1,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: null,
              child: Text(
                ProjectConstants.signUp,
                style: GoogleFonts.poppins(
                    textStyle: ProjectStyles.appBarTextStyle),
                maxLines: 1,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
