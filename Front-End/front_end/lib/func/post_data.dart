// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:front_end/data/employeer.dart';

Employeer employeer = Employeer();
Employeer employee = Employeer();

Uri uri = "http:/localhost:8080/api/employee/login" as Uri;
String url = "http:/localhost:8080/api/employee/login";
Map data = {'email': employee.email, 'password': employee.password};

String body = json.encode(data);

void postData() async {
  final response = await http.post(
    Uri.parse(url),
    body: body,
  );
  print(response.body);
}
