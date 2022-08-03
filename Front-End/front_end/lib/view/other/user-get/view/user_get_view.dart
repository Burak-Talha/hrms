import 'package:flutter/material.dart';
import 'package:front_end/core/base/widget/app-bar/app_bar.dart';
import 'package:front_end/core/constants/constants.dart';
import 'package:front_end/view/other/user-get/view-model/user_get_view_model.dart';

class UserGetView extends StatefulWidget {
  const UserGetView({Key? key}) : super(key: key);

  @override
  State<UserGetView> createState() => _UserGetViewState();
}

class _UserGetViewState extends UserGetViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('User Get'),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(
                resources[index].email ?? '',
                style: titleStyleDark,
              ),
              subtitle: Text(
                resources[index].password ?? '',
                style: labelStyleDark,
              ),
            ),
          );
        },
      ),
    );
  }
}
