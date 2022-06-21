// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:front_end/pages/home/home_employee.dart';
import 'package:front_end/pages/profile/profile_employee.dart';

import 'package:front_end/style/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProfileEmployee(),
        backgroundColor: ProjectColors.whiteColor,
      ),
    );
  }
}
