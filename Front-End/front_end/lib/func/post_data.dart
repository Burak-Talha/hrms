import 'dart:convert';

import 'package:front_end/data/employee/employee.dart';
import 'package:http/http.dart' as http;

Emlpoyee employee = Emlpoyee();

String url = "http://localhost:8080/api/employee/login";

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

void postDataSignUpEmployee() async {
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: bodySignUpEmployee,
  );
  print(response.body);
}

void postDataLoginEmployee() async {
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: bodyLoginEmployee,
  );
  print(response.body);
}
