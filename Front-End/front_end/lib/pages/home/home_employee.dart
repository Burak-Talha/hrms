// ignore_for_file: avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/pages/profile/profile_employee.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/style.dart';

class HomeEmployee extends StatelessWidget {
  const HomeEmployee({Key? key}) : super(key: key);

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
            onPressed: null,
            child: Text(
              constants.home,
              style: GoogleFonts.jost(
                textStyle: ProjectStyles.selectedLabelStyle.copyWith(),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileEmployee()),
              );
            },
            child: Text(
              constants.profile,
              style: GoogleFonts.jost(
                textStyle: ProjectStyles.containerTextStyle.copyWith(),
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
            onPressed: () {},
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
}
