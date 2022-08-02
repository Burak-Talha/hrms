import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scouting_app/core/base/state/base_state.dart';
import 'package:scouting_app/core/base/widget/app-bar/app_bar.dart';
import 'package:scouting_app/core/base/widget/drawer/auth/sign_up/drawer_sign_up.dart';
import 'package:scouting_app/core/constants/constants.dart';
import 'package:scouting_app/view/auth/login/view/login_view.dart';
import 'package:scouting_app/view/auth/sign-up/view-model/sign_up_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends BaseState<SignUpView> {
  final String _titleInfo = 'Sign Up';
  final String _alreadyHaveAnAccount = 'Already have an account?';

  bool isObsecured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(_titleInfo),
      drawer: const SignUpDrawer(),
      body: Column(
        children: [
          const Spacer(),
          _inputEmail(),
          const Spacer(),
          _inputCorporationName(),
          const Spacer(),
          _inputWebSiteName(),
          const Spacer(),
          _inputPassword(),
          const Spacer(),
          _buttons(context),
          const Spacer(flex: 6),
        ],
      ),
    );
  }

  Column _buttons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            await signUpFunction(context);
          },
          child: Text(_titleInfo),
        ),
        CupertinoButton(
            child: Text(_alreadyHaveAnAccount),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            }),
      ],
    );
  }

  Row _inputPassword() {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: dynamicWidth(0.8),
          height: dynamicHeight(0.08),
          decoration: BoxDecoration(
            color: inputColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Center(
              child: TextField(
                obscureText: isObsecured,
                onChanged: (value) {
                  setPassword(value);
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObsecured = !isObsecured;
                      });
                    },
                    icon: isObsecured
                        ? const Icon(Icons.visibility_off_rounded)
                        : const Icon(Icons.visibility_rounded),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Row _inputWebSiteName() {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: dynamicWidth(0.8),
          height: dynamicHeight(0.08),
          decoration: BoxDecoration(
            color: inputColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  setWebSiteName(value);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.web_rounded),
                  border: InputBorder.none,
                  hintText: 'Web Site Name',
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Row _inputCorporationName() {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: dynamicWidth(0.8),
          height: dynamicHeight(0.08),
          decoration: BoxDecoration(
            color: inputColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  setCorporationName(value);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.corporate_fare_rounded),
                  border: InputBorder.none,
                  hintText: 'Corporation Name',
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Row _inputEmail() {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: dynamicWidth(0.8),
          height: dynamicHeight(0.08),
          decoration: BoxDecoration(
            color: inputColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  setEmail(value);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded),
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
