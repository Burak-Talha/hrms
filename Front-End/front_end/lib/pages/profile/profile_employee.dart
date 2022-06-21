// ignore_for_file: duplicate_import, unused_import, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:front_end/pages/home/home_employee.dart';
import 'package:front_end/pages/sign_up/sign_up_employee.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:front_end/data/constants.dart';

class ProfileEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();

    return Row(
      children: [
        sideBar(context, constants),
      ],
    );
  }

  Container sideBar(BuildContext context, Constants constants) {
    return Container(
      width: context.dynamicWidth(0.2),
      color: ProjectColors.infoContainerColor,
      child: Column(
        children: [
          Spacer(),
          TextButton(
            onPressed: null,
            child: Text(
              constants.title,
              style: GoogleFonts.jost(
                textStyle: ProjectStyles.containerTextStyle.copyWith(
                  fontSize: 25,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeEmployee()),
              );
            },
            child: Text(
              constants.home,
              style: GoogleFonts.jost(
                textStyle: ProjectStyles.containerTextStyle.copyWith(),
              ),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: null,
            child: Text(
              constants.profile,
              style: GoogleFonts.jost(
                textStyle: ProjectStyles.selectedLabelStyle.copyWith(),
              ),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              constants.faq,
              style: GoogleFonts.jost(
                textStyle: ProjectStyles.containerTextStyle.copyWith(),
              ),
            ),
          ),
          Spacer(flex: 4),
          TextButton(
            onPressed: () {},
            child: Text(
              constants.logOut,
              style: GoogleFonts.jost(
                textStyle: ProjectStyles.containerTextStyle.copyWith(),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
