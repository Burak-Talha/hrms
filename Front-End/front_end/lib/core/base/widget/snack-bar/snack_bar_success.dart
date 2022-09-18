import 'package:flutter/material.dart';
import 'package:front_end/core/constants/constants.dart';

SnackBar successSnackBar(message) {
  return SnackBar(
    backgroundColor: successColor,
    content: Text('$message successfully!'),
  );
}
