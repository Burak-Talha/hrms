// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:front_end/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:front_end/core/base/widget/snack-bar/snack_bar_success.dart';
import 'package:front_end/view/app/home/view/home_view.dart';
import 'package:front_end/view/auth/login/model/login_model.dart';
import 'package:front_end/view/auth/login/service/login_post_req_service.dart';

final LoginModel _user = LoginModel();

const String _snackBarSuccessMessage = 'Login';

const String _loginErrorMessage =
    'Login failed, Please check your email or password';

Future<void> loginFunction(BuildContext context) async {
  bool isSuccess =
      await postReqLogin(_user.email ?? '', _user.password ?? '', context);
  if (isSuccess == true) {
    ScaffoldMessenger.of(context)
        .showSnackBar(successSnackBar(_snackBarSuccessMessage));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
      (Route<dynamic> route) => false,
    );
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(errorSnackBar(_loginErrorMessage));
  }
}

void setEmail(String email) {
  _user.email = email;
}

void setPassword(String password) {
  _user.password = password;
}
