import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front_end/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:front_end/view/auth/login/google/model/google_login_model.dart';

const String url = "http://localhost:8080/api/employer/google-login";

const String _errorMessageReqFailed = 'Request Failed';

getReqGoogleLogin(BuildContext context) async {
  try {
    Dio dio = Dio();
    var response = await dio.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data;
      if (responseBody is Map<String, dynamic>) {
        var responseBodyData = GoogleLoginModel.fromJson(responseBody);
        return responseBodyData.success;
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(errorSnackBar(_errorMessageReqFailed));
  }
}
