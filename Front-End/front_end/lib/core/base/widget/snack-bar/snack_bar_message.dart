import 'package:flutter/material.dart';
import 'package:front_end/core/constants/constants.dart';

SnackBar messageSnackBar(message) {
  return SnackBar(
    backgroundColor: appBarColor,
    content: Text('$message'),
  );
}
