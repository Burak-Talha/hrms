// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/pages/profile/profile_employee.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/style.dart';

class HomeEmployee extends StatelessWidget {
  const HomeEmployee({Key? key}) : super(key: key);

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
              onPressed: null,
              child: Text(
                constants.home,
                style: ProjectStyles.selectedLabelStyle,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEmployee(),
                  ),
                );
              },
              child: Text(
                constants.profile,
                style: ProjectStyles.labelTextStyle,
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
