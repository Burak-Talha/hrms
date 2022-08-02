import 'package:flutter/material.dart';
import 'package:scouting_app/core/constants/constants.dart';

SnackBar successSnackBar(message) {
  return SnackBar(
    backgroundColor: successColor,
    content: Text('$message successfully!'),
  );
}
