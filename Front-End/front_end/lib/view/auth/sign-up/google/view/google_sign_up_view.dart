// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:front_end/core/base/state/base_state.dart';
import 'package:front_end/core/base/widget/app-bar/app_bar.dart';
import 'package:front_end/core/constants/constants.dart';
import 'package:front_end/view/auth/sign-up/view-model/sign_up_view_model.dart';

class GoogleSignUpView extends StatefulWidget {
  const GoogleSignUpView({Key? key}) : super(key: key);

  @override
  State<GoogleSignUpView> createState() => _GoogleSignUpViewState();
}

class _GoogleSignUpViewState extends BaseState<GoogleSignUpView> {
  @override
  Widget build(BuildContext context) {
    bool isObsecured = true;
    const String _title = 'Sign Up';
    return Scaffold(
      appBar: appBar(_title),
      body: Column(
        children: [
          const Spacer(),
          _inputCorporationName(),
          const Spacer(),
          _inputWebSiteName(),
          const Spacer(),
          _inputPassword(isObsecured),
          const Spacer(),
          _buttons(context),
          const Spacer(flex: 6),
        ],
      ),
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

  Row _inputPassword(bool isObsecured) {
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
                onChanged: (value) {},
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
}

Column _buttons(BuildContext context) {
  const String _loginText = 'Sign Up';

  return Column(
    children: [
      ElevatedButton(onPressed: () async {}, child: const Text(_loginText)),
    ],
  );
}
