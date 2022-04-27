import 'package:flutter/material.dart';
import 'package:fusion_ui/constants/constants.dart';
import 'package:fusion_ui/theme-style/colors.dart';

class RegisterR extends StatefulWidget {
  const RegisterR({Key? key}) : super(key: key);

  @override
  State<RegisterR> createState() => _RegisterRState();
}

class _RegisterRState extends State<RegisterR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(homeConstants().titleEmployeerRegisterT)),
      bottomNavigationBar: const bottomNavigateBarWidget(),
      body: const myBody(),
    );
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
    return Column(
      children: [
        const iconHome(),
        const Spacer(flex: 7),
        const mailInput(),
        const Spacer(flex: 1),
        const tcInput(),
        const Spacer(flex: 1),
        const passwordInput(),
        const Spacer(flex: 1),
        const buttons(),
        const Spacer(flex: 9),
      ],
    );
  }
}

class iconHome extends StatefulWidget {
  const iconHome({
    Key? key,
  }) : super(key: key);

  @override
  State<iconHome> createState() => _iconHomeState();
}

class _iconHomeState extends State<iconHome> {
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.corporate_fare_rounded);
  }
}

class tcInput extends StatefulWidget {
  const tcInput({
    Key? key,
  }) : super(key: key);

  @override
  State<tcInput> createState() => _tcInputState();
}

class _tcInputState extends State<tcInput> {
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
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: homeConstants().tcT,
                    icon: const Icon(Icons.numbers_rounded)),
              )),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

class buttons extends StatefulWidget {
  const buttons({
    Key? key,
  }) : super(key: key);

  @override
  State<buttons> createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const Spacer(), const registerButton(), const Spacer()],
    );
  }
}

class registerButton extends StatefulWidget {
  const registerButton({
    Key? key,
  }) : super(key: key);

  @override
  State<registerButton> createState() => _registerButtonState();
}

class _registerButtonState extends State<registerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {}, child: Text(homeConstants().signupT));
  }
}

class loginButton extends StatefulWidget {
  const loginButton({
    Key? key,
  }) : super(key: key);

  @override
  State<loginButton> createState() => _loginButtonState();
}

class _loginButtonState extends State<loginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {}, child: Text(homeConstants().loginT));
  }
}

class mailInput extends StatefulWidget {
  const mailInput({
    Key? key,
  }) : super(key: key);

  @override
  State<mailInput> createState() => _mailInputState();
}

class _mailInputState extends State<mailInput> {
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
                decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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

class passwordInput extends StatefulWidget {
  const passwordInput({
    Key? key,
  }) : super(key: key);

  @override
  State<passwordInput> createState() => _passwordInputState();
}

class _passwordInputState extends State<passwordInput> {
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
