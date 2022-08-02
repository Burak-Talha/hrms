import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scouting_app/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:scouting_app/core/constants/constants.dart';
import 'package:scouting_app/view/auth/login/view/login_view.dart';

class SignUpDrawer extends StatelessWidget {
  final String _draerTitleAppName = 'Scouting App';
  final String _drawerTitleLogin = 'Login';
  final String _drawerTitleSignUp = 'Sign Up';
  final String _drawerTitleHelp = 'Help';
  final String _drawerTitleQuit = 'Quit';
  final String _drawerTitleSettings = 'Settings';

  final String _errorMessageNotReadyYet = 'Not ready yet';

  const SignUpDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Icon(
                    Icons.content_paste_search_rounded,
                    size: 80,
                    color: appBarColor,
                  ),
                  Text(
                    _draerTitleAppName,
                    style: titleStyleDark.copyWith(color: appBarColor),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              title: Text(
                _drawerTitleLogin,
                style: labelStyleDark,
              ),
              leading: const Icon(Icons.login_outlined),
            ),
            ListTile(
              title: Text(
                _drawerTitleSignUp,
                style: labelStyleSelected,
              ),
              leading: const Icon(Icons.person_add_outlined),
              iconColor: appBarColor,
            ),
            ListTile(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(errorSnackBar(_errorMessageNotReadyYet));
              },
              title: Text(
                _drawerTitleSettings,
                style: labelStyleDark,
              ),
              subtitle: Text('not ready yet', style: labelStyleError),
              leading: const Icon(Icons.settings_outlined),
            ),
            ListTile(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(errorSnackBar(_errorMessageNotReadyYet));
              },
              title: Text(
                _drawerTitleHelp,
                style: labelStyleDark,
              ),
              subtitle: Text('not ready yet', style: labelStyleError),
              leading: const Icon(Icons.help_outline_rounded),
            ),
            const Spacer(),
            ListTile(
              onTap: () {
                exit(0);
              },
              title: Text(
                _drawerTitleQuit,
                style: labelStyleDark,
              ),
              leading: const Icon(Icons.exit_to_app_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
