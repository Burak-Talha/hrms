// ignore_for_file: duplicate_import, unused_import, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:front_end/pages/home/home_employee.dart';
import 'package:front_end/pages/sign_up/sign_up_employee.dart';
import 'package:front_end/style/style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:front_end/data/constants.dart';

class ProfileEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();

    return Column(
      children: [
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            Text(constants.title,
                style: GoogleFonts.jost(
                  textStyle:
                      ProjectStyles.titleTextStyle.copyWith(fontSize: 25),
                )),
            const Spacer(flex: 2),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeEmployee(),
                  ),
                );
              },
              child: Text(
                constants.home,
                style: ProjectStyles.titleTextStyle,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: null,
              child: Text(
                constants.profile,
                style: ProjectStyles.selectedLabelStyle,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                constants.faq,
                style: ProjectStyles.titleTextStyle,
              ),
            ),
            const Spacer(),
          ],
        ),
        Row(
          children: [],
        ),
        const Spacer(
          flex: 50,
        ),
      ],
    );
  }
}
