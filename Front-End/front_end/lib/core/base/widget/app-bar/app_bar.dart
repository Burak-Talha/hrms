import 'package:flutter/material.dart';
import 'package:front_end/core/constants/constants.dart';

AppBar appBar(String info) {
  // ignore: no_leading_underscores_for_local_identifiers
  final String _title = "HRMS - $info";
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: appBarColor,
    title: Text(
      _title,
      style: titleStyleLight,
    ),
  );
}
