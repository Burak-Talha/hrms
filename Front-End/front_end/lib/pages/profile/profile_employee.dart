import 'package:flutter/material.dart';

import 'package:front_end/widgets/content/profile_content.dart';
import 'package:front_end/widgets/side_bar/side_bar_profile.dart';

import 'package:front_end/data/constants.dart';

class ProfileEmployee extends StatelessWidget {
  const ProfileEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    return Row(
      children: [
        sideBarProfile(context, constants),
        const Spacer(),
        profileContent(context, constants),
        const Spacer(),
      ],
    );
  }
}
