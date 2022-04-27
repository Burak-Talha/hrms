import 'package:flutter/material.dart';
import 'package:fusion_ui/constants/constants.dart';
import 'package:fusion_ui/constants/data/user.dart';
import 'package:fusion_ui/pages/register/register_r.dart';
import 'package:fusion_ui/theme-style/colors.dart';

import 'package:http/http.dart' as http;

class LoginR extends StatefulWidget {
  const LoginR({Key? key}) : super(key: key);

  @override
  State<LoginR> createState() => _LoginRState();
}

class _LoginRState extends State<LoginR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(homeConstants().titleEmployeerLoginT)),
        bottomNavigationBar: const bottomNavigateBarWidget(),
        body: const myBody());
  }
}

class myBody extends StatefulWidget {
  const myBody({
    Key? key,
  }) : super(key: key);

  @override
  State<myBody> createState() => _myBodyState();
}

class _myBodyState extends State<myBody> {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    User user = User("", "");
    /*String url = "http://localhost:8080/login";
    Future save() async {
      await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'email': user.mail, 'password': user.password}));
      print(res.body);
    }*/

    return Form(
      key: _key,
      child: Column(
        children: [
          const homeIcon(),
          const Spacer(flex: 7),
          mailInput(user: user),
          const Spacer(flex: 1),
          passwordInput(user: user),
          const Spacer(flex: 1),
          buttons(user: user),
          const Spacer(flex: 9),
        ],
      ),
    );
  }
}

class buttons extends StatefulWidget {
  buttons({Key? key, required this.user}) : super(key: key);

  User user = User("", "");

  @override
  State<buttons> createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 3,
        ),
        loginButton(
          user: widget.user,
        ),
        const Spacer(
          flex: 1,
        ),
        const signUpButton(),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}

class loginButton extends StatefulWidget {
  loginButton({Key? key, required user}) : super(key: key);

  @override
  State<loginButton> createState() => _loginButtonState();
}

class _loginButtonState extends State<loginButton> {
  User user = User("", "");

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print('Mail: $user.mail Şifre: $user.password');
        },
        child: Text(homeConstants().loginT));
  }
}

class mailInput extends StatefulWidget {
  mailInput({
    Key? key,
    required this.user,
  }) : super(key: key);

  User user = User("", "");

  @override
  State<mailInput> createState() => _mailInputState();
}

class _mailInputState extends State<mailInput> {
  User user = User("", "");

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Row(
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 10,
            child: TextFormField(
                onChanged: (value) {
                  user.mail = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: homeConstants().mailT,
                  icon: const Icon(Icons.mail_outline_rounded),
                )),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class homeIcon extends StatefulWidget {
  const homeIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<homeIcon> createState() => _homeIconState();
}

class _homeIconState extends State<homeIcon> {
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.corporate_fare_rounded);
  }
}

class signUpButton extends StatefulWidget {
  const signUpButton({
    Key? key,
  }) : super(key: key);

  @override
  State<signUpButton> createState() => _signUpButtonState();
}

class _signUpButtonState extends State<signUpButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const RegisterR(),
            ),
          );
        },
        child: Text(homeConstants().signupT));
  }
}

class passwordInput extends StatefulWidget {
  passwordInput({
    Key? key,
    required this.user,
  }) : super(key: key);

  User user = User("", "");

  @override
  State<passwordInput> createState() => _passwordInputState();
}

class _passwordInputState extends State<passwordInput> {
  User user = User("", "");

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Row(
        children: [
          const Spacer(flex: 1),
          Expanded(
              flex: 10,
              child: TextFormField(
                onChanged: (value) {
                  user.password = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: homeConstants().passwordT,
                    icon: const Icon(Icons.password_rounded)),
              )),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

class bottomNavigateBarWidget extends StatefulWidget {
  const bottomNavigateBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<bottomNavigateBarWidget> createState() =>
      _bottomNavigateBarWidgetState();
}

class _bottomNavigateBarWidgetState extends State<bottomNavigateBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_rounded)),
          label: homeConstants().employeeT),
      BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.corporate_fare_rounded)),
          label: homeConstants().employeerT),
    ]);
  }
}

class titleText extends StatefulWidget {
  const titleText({
    Key? key,
  }) : super(key: key);

  @override
  State<titleText> createState() => _titleTextState();
}

class _titleTextState extends State<titleText> {
  @override
  Widget build(BuildContext context) {
    return Text(homeConstants().titleEmployeerLoginT);
  }
}
