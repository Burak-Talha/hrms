import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion_ui/pages/login/login.dart';
import 'package:fusion_ui/pages/login/login_r.dart' show LoginR;
import 'package:fusion_ui/pages/register/register.dart';
import 'package:fusion_ui/pages/register/register_r.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
              toolbarHeight: 70,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.transparent,
              elevation: 0),
        ),
        home: const LoginR());
  }
}
