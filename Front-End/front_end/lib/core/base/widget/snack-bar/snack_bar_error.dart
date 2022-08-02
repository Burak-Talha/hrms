import 'package:flutter/material.dart';
import 'package:scouting_app/core/constants/constants.dart';

SnackBar errorSnackBar(message) {
  return SnackBar(
    backgroundColor: errorColor,
    content: Text('Error! $message'),
  );
}
