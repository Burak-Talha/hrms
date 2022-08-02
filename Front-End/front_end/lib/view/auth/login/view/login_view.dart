import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scouting_app/core/base/state/base_state.dart';
import 'package:scouting_app/core/base/widget/app-bar/app_bar.dart';
import 'package:scouting_app/core/base/widget/drawer/auth/login/drawer_login.dart';
import 'package:scouting_app/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:scouting_app/core/constants/constants.dart';
import 'package:scouting_app/view/auth/login/google/service/login_with_google_launch_url.dart';
import 'package:scouting_app/view/auth/login/model/login_model.dart';

import 'package:scouting_app/view/auth/login/view-model/login_view_model.dart';
import 'package:scouting_app/view/auth/sign-up/view/sign_up_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _user.email = "";
    _user.password = "";
  }

  final LoginModel _user = LoginModel();

  final String _titleInfo = 'Login';
  final String _forgotPassword = 'Forgot password?';
  final String _dontHaveAnAccount = "Don't have an account?";

  final String _notReadyYetErrorMessage = 'Not ready yet';

  final String _googleIconUrl = 'https://freesvg.org/img/1534129544.png';
  final String _loginWithGoogle = 'Login with Google';

  final String _facebookIconUrl =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png';
  final String _loginWithFacebook = 'Login with Facebook';

  final String _githubIconUrl =
      'https://cdn-icons-png.flaticon.com/512/25/25231.png';
  final String _loginWithGithub = 'Login with Github';

  bool isObsecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(_titleInfo),
      drawer: const LoginDrawer(),
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          _inputEmail(),
          const Spacer(),
          _inputPassword(),
          const Spacer(),
          _buttons(),
          const Spacer(flex: 6),
        ],
      ),
    );
  }

  Column _buttons() {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            await loginFunction(context);
          },
          child: Container(
            width: dynamicWidth(0.65),
            height: dynamicHeight(0.05),
            decoration: BoxDecoration(
              color: appBarColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                _titleInfo,
                style: labelStyleLight.copyWith(fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CupertinoButton(
            child: Text(_forgotPassword),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                errorSnackBar(_notReadyYetErrorMessage),
              );
            }),
        CupertinoButton(
            child: Text(_dontHaveAnAccount),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpView()),
              );
            }),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () async {
            await loginGoogleLaunchUrl(context);
          },
          child: Container(
            width: dynamicWidth(0.65),
            height: dynamicHeight(0.07),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(_googleIconUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    _loginWithGoogle,
                    style: labelStyleDark,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () async {},
          child: Container(
            width: dynamicWidth(0.65),
            height: dynamicHeight(0.07),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(_facebookIconUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    _loginWithFacebook,
                    style: labelStyleDark,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () async {},
          child: Container(
            width: dynamicWidth(0.65),
            height: dynamicHeight(0.07),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(_githubIconUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    _loginWithGithub,
                    style: labelStyleDark,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
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
