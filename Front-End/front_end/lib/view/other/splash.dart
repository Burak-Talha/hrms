import 'package:flutter/material.dart';
import 'package:front_end/core/base/state/base_state.dart';
import 'package:front_end/core/constants/constants.dart';
import 'package:front_end/view/auth/login/view/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  final String _appName = "Scouting App";
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: dynamicWidth(1),
        height: dynamicHeight(1),
        color: appBarColor,
        child: Center(
            child: Column(
          children: [
            const Spacer(),
            Icon(
              Icons.content_paste_search_rounded,
              color: backgroundColor,
              size: 70,
            ),
            const SizedBox(height: 15),
            Text(
              _appName,
              style: titleStyleLight,
            ),
            const Spacer(),
          ],
        )),
      ),
    );
  }
}
