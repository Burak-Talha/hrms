import 'package:flutter/material.dart';
import 'package:scouting_app/core/constants/constants.dart';

SnackBar messageSnackBar(message) {
  return SnackBar(
    backgroundColor: appBarColor,
    content: Text('$message'),
  );
}
