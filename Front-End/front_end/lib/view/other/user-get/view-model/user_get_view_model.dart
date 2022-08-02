import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scouting_app/view/other/user-get/model/user_get_model.dart';
import 'package:scouting_app/view/other/user-get/service/user_get_service.dart';
import '../view/user_get_view.dart';

abstract class UserGetViewModel extends State<UserGetView> {
  late final UserGetService userGetService;
  final String url = 'http://localhost:8080/api/employer/getall';

  List<DataList> resources = [];
  @override
  void initState() {
    super.initState();
    userGetService = UserGetService(Dio(BaseOptions(baseUrl: url)));
    fetch();
  }

  Future<void> fetch() async {
    resources = (await userGetService.fetchUser())?.dataList ?? [];
  }
}
