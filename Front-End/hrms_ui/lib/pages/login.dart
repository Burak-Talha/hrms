// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_ui/data/constants.dart';
import 'package:hrms_ui/hrms_entity/employeer.dart';
import 'package:hrms_ui/pages/sign-up.dart';
import 'package:hrms_ui/theme/colors.dart';
import 'package:hrms_ui/theme/styles.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

Employeer employeer = Employeer();
Uri uri = "http://localhost:8080/login" as Uri;

class _LoginState extends State<Login> {
  Future save() async {
    var res = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': employeer.getMail(),
          'password': employeer.getPassword()
        }));
    print("miyav");
  }

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
                  flex: 1,
                  child: Expanded(
                    flex: 3,
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
                                child: Text(ProjectConstants.login,
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
                                    flex: 3,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextFormField(
                                      onChanged: (email) {
                                        employeer.setEmail(email);
                                      },
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
                                    flex: 3,
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
                                    flex: 3,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextFormField(
                                      onChanged: (password) {
                                        employeer.setPassword(password);
                                      },
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
                                  const Spacer(
                                    flex: 3,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: () {
                                  print(employeer.getMail());
                                  print(employeer.getPassword());

                                  // save();
                                },
                                child: Text(
                                  ProjectConstants.login,
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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
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
              maxLines: 4,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: null,
              child: Text(
                ProjectConstants.login,
                style: GoogleFonts.poppins(
                    textStyle: ProjectStyles.appBarTextStyle),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
              child: Text(
                ProjectConstants.signUp,
                style: GoogleFonts.poppins(
                    textStyle: ProjectStyles.appBarTextStyle),
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
