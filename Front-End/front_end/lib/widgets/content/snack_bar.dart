import 'package:flutter/material.dart';
import 'package:front_end/data/constants.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';

SnackBar errorSnackBar(BuildContext context) {
  Constants constants = Constants();

  return SnackBar(
    backgroundColor: ProjectColors.error,
    content: SizedBox(
      height: context.dynamicWidth(0.03),
      child: Column(
        children: [
          Text(
            constants.loginFailed,
            style: ProjectStyles.containerTextStyle
                .copyWith(color: ProjectColors.whiteColor, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}

SnackBar succsessSnackBar(BuildContext context) {
  Constants constants = Constants();
  return SnackBar(
    backgroundColor: ProjectColors.green,
    content: SizedBox(
      height: context.dynamicWidth(0.03),
      child: Column(
        children: [
          Text(
            constants.loginSuccess,
            style: ProjectStyles.containerTextStyle
                .copyWith(color: ProjectColors.whiteColor, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
