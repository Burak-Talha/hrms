import 'package:flutter/material.dart';
import 'package:scouting_app/core/base/state/base_state.dart';
import 'package:scouting_app/core/base/widget/app-bar/app_bar.dart';

class HelpView extends StatefulWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends BaseState<HelpView> {
  final String _titleInfo = 'Help';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(_titleInfo),
    );
  }
}
