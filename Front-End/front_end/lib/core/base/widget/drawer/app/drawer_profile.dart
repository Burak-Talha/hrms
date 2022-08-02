import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scouting_app/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:scouting_app/core/base/widget/snack-bar/snack_bar_message.dart';
import 'package:scouting_app/core/constants/constants.dart';
import 'package:scouting_app/view/app/home/view/home_view.dart';
import 'package:scouting_app/view/auth/login/view/login_view.dart';

class ProfileDrawer extends StatelessWidget {
  final String _draerTitleAppName = 'Scouting App';
  final String _drawerTitleHome = 'Home';
  final String _drawerTitleProfile = 'Profile';
  final String _drawerTitleHelp = 'Help';
  final String _drawerTitleQuit = 'Quit';
  final String _drawerTitleSignOut = 'Sign Out';
  final String _drawerTitleSettings = 'Settings';

  final String _drawerMessageSignOut = 'Sign Out Successfully';
  final String _errorMessageNotReadyYet = 'Not ready yet';

  const ProfileDrawer({Key? key}) : super(key: key);

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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                  (Route<dynamic> route) => false,
                );
              },
              title: Text(
                _drawerTitleHome,
                style: labelStyleDark,
              ),
              leading: const Icon(Icons.login_outlined),
            ),
            ListTile(
              title: Text(
                _drawerTitleProfile,
                style: labelStyleSelected,
              ),
              leading: const Icon(Icons.person_outlined),
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
                ScaffoldMessenger.of(context)
                    .showSnackBar(messageSnackBar(_drawerMessageSignOut));
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                  (Route<dynamic> route) => false,
                );
              },
              title: Text(
                _drawerTitleSignOut,
                style: labelStyleDark,
              ),
              leading: const Icon(Icons.do_not_disturb_alt_outlined),
            ),
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
