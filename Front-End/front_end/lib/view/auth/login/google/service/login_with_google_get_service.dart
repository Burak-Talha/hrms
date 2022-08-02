import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scouting_app/core/base/widget/snack-bar/snack_bar_error.dart';

const String url = "http://localhost:8080/restricted";

const String _errorMessageReqFailed = 'Request Failed';

getReqGoogleLogin(BuildContext context) async {
  try {
    // ignore: avoid_print

    // ignore: unused_local_variable
    Dio dio = Dio();
    var response = await dio.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data;
      if (responseBody is Map<String, dynamic>) {
        //var responseBodyData = LoginResponseBodyModel.fromJson(responseBody);
        //return responseBodyData.success;
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(errorSnackBar(_errorMessageReqFailed));
  }
}
