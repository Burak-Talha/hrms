import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/pages/home/home_employee.dart';
import 'package:front_end/pages/login/login_employee.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';
import 'package:google_fonts/google_fonts.dart';

Container sideBarProfile(BuildContext context, Constants constants) {
  return Container(
    width: context.dynamicWidth(0.2),
    color: ProjectColors.infoContainerColor,
    child: Column(
      children: [
        const Spacer(),
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
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeEmployee()),
            );
          },
          child: Text(
            constants.home,
            style: GoogleFonts.jost(
              textStyle: ProjectStyles.containerTextStyle.copyWith(),
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: null,
          child: Text(
            constants.profile,
            style: GoogleFonts.jost(
              textStyle: ProjectStyles.selectedLabelStyle.copyWith(),
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            constants.faq,
            style: GoogleFonts.jost(
              textStyle: ProjectStyles.containerTextStyle.copyWith(),
            ),
          ),
        ),
        const Spacer(flex: 4),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginEmployee(),
              ),
            );
          },
          child: Text(
            constants.logOut,
            style: GoogleFonts.jost(
              textStyle: ProjectStyles.containerTextStyle.copyWith(),
            ),
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}
