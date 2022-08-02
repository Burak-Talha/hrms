import 'package:flutter/material.dart';

Color get backgroundColor => Colors.white;

Color get labelColorDark => Colors.black;
Color get labelColorLight => Colors.white;

Color get inputColor => const Color.fromARGB(255, 223, 223, 223);

Color get transparent => Colors.transparent;

Color get appBarColor => const Color(0xff0065b2);

Color get greyColor => const Color.fromARGB(255, 236, 236, 236);

Color get errorColor => Colors.redAccent;
Color get successColor => Colors.green;

TextStyle get labelStyleDark => TextStyle(
      color: labelColorDark,
      fontSize: 15,
    );
TextStyle get labelStyleLight => TextStyle(
      color: labelColorLight,
      fontSize: 15,
    );
TextStyle get labelStyleSelected => TextStyle(
      color: appBarColor,
      fontSize: 15,
    );
TextStyle get labelStyleError => TextStyle(
      color: errorColor,
      fontSize: 15,
    );

TextStyle get titleStyleLight => TextStyle(
      color: labelColorLight,
      fontSize: 25,
    );
TextStyle get titleStyleDark => TextStyle(
      color: labelColorDark,
      fontSize: 25,
    );
