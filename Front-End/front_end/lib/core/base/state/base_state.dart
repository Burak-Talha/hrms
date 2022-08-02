import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get theme => Theme.of(context);
  double dynamicWidth(double val) => MediaQuery.of(context).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(context).size.height * val;
}
