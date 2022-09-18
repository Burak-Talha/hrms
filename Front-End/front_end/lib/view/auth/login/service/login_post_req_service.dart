import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front_end/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:front_end/view/auth/login/model/response_body_model.dart';

const String url = "http://localhost:8080/api/employer/login";

const String _errorMessageReqFailed = 'Request Failed';

postReqLogin(String email, String password, BuildContext context) async {
  try {
    // ignore: avoid_print
    print("User Info: $email, $password");

    // ignore: unused_local_variable
    Dio dio = Dio();
    var response =
        await dio.post(url, data: {'email': email, 'password': password});
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data;
      if (responseBody is Map<String, dynamic>) {
        var responseBodyData = LoginResponseBodyModel.fromJson(responseBody);
        return responseBodyData.success;
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(errorSnackBar(_errorMessageReqFailed));
  }
}
