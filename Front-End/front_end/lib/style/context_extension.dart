import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

extension NumberExtension on BuildContext {
  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicWidth(0.03);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllow => EdgeInsets.all(dynamicWidth(lowValue));
}
