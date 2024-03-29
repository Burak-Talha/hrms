import 'package:flutter/material.dart';
import 'package:front_end/core/base/state/base_state.dart';
import 'package:front_end/core/base/widget/app-bar/app_bar.dart';
import 'package:front_end/core/base/widget/drawer/app/drawer_home.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Home'),
      drawer: const HomeDrawer(),
    );
  }
}
