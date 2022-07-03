import 'package:flutter/material.dart';
import 'package:front_end/style/context_extension.dart';
import 'package:front_end/style/style.dart';

SnackBar errorSnackBar(BuildContext context, constants) {
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
