import 'package:flutter/material.dart';
import 'package:front_end/core/constants/constants.dart';

SnackBar errorSnackBar(message) {
  return SnackBar(
    backgroundColor: errorColor,
    content: Text('Error! $message'),
  );
}
