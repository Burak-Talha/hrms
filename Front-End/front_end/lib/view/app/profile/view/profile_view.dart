import 'package:flutter/material.dart';
import 'package:front_end/core/base/state/base_state.dart';
import 'package:front_end/core/base/widget/app-bar/app_bar.dart';
import 'package:front_end/core/base/widget/drawer/app/drawer_profile.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Profile'),
      drawer: const ProfileDrawer(),
      body: ListView(),
    );
  }
}
