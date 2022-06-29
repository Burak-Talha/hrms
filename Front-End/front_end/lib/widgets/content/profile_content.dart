import 'package:flutter/material.dart';

import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:front_end/data/constants.dart';

Container profileContent(BuildContext context, Constants constants) {
  return Container(
    width: context.dynamicWidth(0.6),
    height: context.dynamicHeight(0.7),
    color: ProjectColors.loginContainerColor,
    child: Column(
      children: [
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: null,
              child: Text(
                constants.name,
                style: GoogleFonts.jost(
                  textStyle: ProjectStyles.labelTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: null,
              child: Text(
                constants.examlpeName,
                style: GoogleFonts.jost(
                  textStyle: ProjectStyles.labelTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: null,
              child: Text(
                constants.surname,
                style: GoogleFonts.jost(
                  textStyle: ProjectStyles.labelTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: null,
              child: Text(
                constants.exapmleSurname,
                style: GoogleFonts.jost(
                  textStyle: ProjectStyles.labelTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: null,
              child: Text(
                constants.email,
                style: GoogleFonts.jost(
                  textStyle: ProjectStyles.labelTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: null,
              child: Text(
                constants.exampleMail,
                style: GoogleFonts.jost(
                  textStyle: ProjectStyles.labelTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    ),
  );
}
