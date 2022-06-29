import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';

import 'package:front_end/widgets/side_bar/side_bar_home.dart';

class HomeEmployee extends StatefulWidget {
  const HomeEmployee({Key? key}) : super(key: key);

  @override
  State<HomeEmployee> createState() => _HomeEmployeeState();
}

class _HomeEmployeeState extends State<HomeEmployee> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();

    return Row(
      children: [
        sideBarHome(context, constants),
      ],
    );
  }
}
