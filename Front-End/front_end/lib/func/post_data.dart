// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:front_end/data/employee/employee.dart';
import 'package:http/http.dart' as http;

Emlpoyee employee = Emlpoyee();

String url = "http://localhost:8080/api/employee/login";

Map dataSignUpEmployee = {
  'name': employee.getName(),
  'surname': employee.getSurname(),
  'email': employee.getEmail(),
  'password': employee.getPassword(),
};

String bodySignUpEmployee = json.encode(dataSignUpEmployee);

const Map<String, String> headers = {
  "Content-Type": "application/json",
  "Cookie": "JSESSIONID=953878B4CAA951F72256C201F88A28DA"
};

Map dataLoginEmployee = {
  'email': employee.getEmail(),
  'password': employee.getPassword(),
};

String bodyLoginEmployee = json.encode(dataLoginEmployee);

postDataSignUpEmployee() async {
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: bodySignUpEmployee,
  );
}

postDataLoginEmployee() async {
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: bodyLoginEmployee,
  );

  return response.body;
}
