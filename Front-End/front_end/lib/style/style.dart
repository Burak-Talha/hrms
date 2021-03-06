import 'package:flutter/material.dart';

class ProjectStyles {
  static TextStyle containerTextStyle = TextStyle(
    color: ProjectColors.loginContainerColor,
    letterSpacing: 2,
  );
  static TextStyle labelTextStyle = TextStyle(
    color: ProjectColors.labelColor,
  );
  static TextStyle titleTextStyle = TextStyle(
    color: ProjectColors.labelColor,
    letterSpacing: 2,
    fontSize: 30,
  );
  static TextStyle selectedLabelStyle = TextStyle(
    color: ProjectColors.whiteColor,
    decoration: TextDecoration.underline,
    letterSpacing: 2,
  );
}

class ProjectColors {
  static Color labelColor = Colors.black;
  static Color whiteColor = Colors.white;
  static Color error = Colors.redAccent;
  static Color green = Colors.green;
  static Color transparentColor = Colors.transparent;
  static Color infoContainerColor = const Color(0xFF01579b);
  static Color loginContainerColor = const Color(0xFFf3f2ef);
}
