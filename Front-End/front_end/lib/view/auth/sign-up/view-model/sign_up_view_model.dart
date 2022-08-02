// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:scouting_app/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:scouting_app/core/base/widget/snack-bar/snack_bar_success.dart';
import 'package:scouting_app/view/auth/login/view/login_view.dart';
import 'package:scouting_app/view/auth/sign-up/model/sign_up_model.dart';
import 'package:scouting_app/view/auth/sign-up/service/sign_up_post_req_service.dart';

SignUpModel _signUpModel = SignUpModel();

const String _snackBarSuccessMessage = 'Sign Up';

const String _signUpErrorMessage = 'Sign Up failed';

Future<void> signUpFunction(BuildContext context) async {
  bool isSuccess = await postReqSignUp(
      _signUpModel.email ?? '',
      _signUpModel.password ?? '',
      _signUpModel.corporationName ?? '',
      _signUpModel.webSiteName ?? '',
      context);

  if (isSuccess == true) {
    ScaffoldMessenger.of(context)
        .showSnackBar(successSnackBar(_snackBarSuccessMessage));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
      (Route<dynamic> route) => false,
    );
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(errorSnackBar(_signUpErrorMessage));
  }
}

void setEmail(String email) {
  _signUpModel.email = email;
}

void setPassword(String password) {
  _signUpModel.password = password;
}

void setWebSiteName(String webSiteName) {
  _signUpModel.webSiteName = webSiteName;
}

void setCorporationName(String corporationName) {
  _signUpModel.corporationName = corporationName;
}
