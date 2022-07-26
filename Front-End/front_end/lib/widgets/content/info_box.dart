import 'package:flutter/material.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';
import 'package:google_fonts/google_fonts.dart';

Padding infoBoxWidget(BuildContext context, constants) {
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
              constants.welcome,
              style: GoogleFonts.jost(
                  textStyle:
                      ProjectStyles.containerTextStyle.copyWith(fontSize: 20)),
            ),
          ),
        ],
      ),
    ),
  );
}
