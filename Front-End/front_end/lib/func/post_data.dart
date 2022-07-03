// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:front_end/data/employee/employee.dart';
import 'package:http/http.dart' as http;

Emlpoyee employee = Emlpoyee();

String url = "https://lochalhost:8080/emlpoyee/getall";

Map dataSignUpEmployee = {
  'name': employee.name,
  'surname': employee.surname,
  'email': employee.email,
  'password': employee.password,
};

String bodySignUpEmployee = json.encode(dataSignUpEmployee);

Map dataLoginEmployee = {
  'email': employee.email,
  'password': employee.password,
};

String bodyLoginEmployee = json.encode(dataLoginEmployee);

Future<String> postDataSignUpEmployee() async {
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: bodySignUpEmployee,
  );
  return response.body;
}

Future<String> postDataLoginEmployee() async {
  var response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: bodyLoginEmployee,
  );
  return response.body;
}
