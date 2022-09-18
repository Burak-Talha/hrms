import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front_end/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:front_end/view/auth/sign-up/model/sign_up_response_body_model.dart';

const String url = "http://localhost:8080/api/employer/add";
postReqSignUp(String email, String password, String corporationName,
    String webSiteName, BuildContext context) async {
  const String requestFailedErrorMessage = 'Request Failed';
  try {
    // ignore: avoid_print
    print("User Info: $email, $password, $corporationName, $webSiteName");

    Dio dio = Dio();
    var response = await dio.post(url, data: {
      'email': email,
      'password': password,
      'corporation_name': corporationName,
      'web_site_name': webSiteName
    });
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data;
      if (responseBody is Map<String, dynamic>) {
        var responseBodyData = SignUpResponseBodyModel.fromJson(responseBody);
        return responseBodyData.success;
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(errorSnackBar(requestFailedErrorMessage));
  }
}
