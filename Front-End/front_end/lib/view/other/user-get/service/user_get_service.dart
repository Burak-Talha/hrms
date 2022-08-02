import 'dart:io';

import 'package:dio/dio.dart';
import 'package:scouting_app/view/other/user-get/model/user_get_model.dart';

abstract class IUserGetService {
  IUserGetService(this.dio);
  final Dio dio;

  Future<UserModel?> fetchUser();
}

class UserGetService extends IUserGetService {
  UserGetService(super.dio);

  @override
  Future<UserModel?> fetchUser() async {
    final response = await dio.get("http://localhost:8080/api/employer/getall");

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return UserModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
