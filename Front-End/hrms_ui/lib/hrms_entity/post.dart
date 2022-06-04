import 'package:hrms_ui/hrms_entity/employeer.dart';
import 'package:http/http.dart' as http;

class Post {
  Employeer employeer = Employeer();
  Uri uri = "http:/localhost:8080/api/employee/login" as Uri;
  String url = "http:/localhost:8080/api/employee/login";
  void postData() async {
    final response = await http.post(
      Uri.parse(url),
      body: {
        "email": employeer.email,
        "password": employeer.password,
      },
    );
    print(response.body);
  }
}
