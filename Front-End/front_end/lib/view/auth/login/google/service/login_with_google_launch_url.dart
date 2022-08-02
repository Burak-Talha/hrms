// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:scouting_app/core/base/widget/snack-bar/snack_bar_error.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> loginGoogleLaunchUrl(BuildContext context) async {
  const String _googleLoginUrl = 'http://localhost:8080/restricted';
  if (await canLaunch(_googleLoginUrl)) {
    await launch(_googleLoginUrl, forceSafariVC: false, forceWebView: false);
  } else {
    throw ScaffoldMessenger.of(context)
        .showSnackBar(errorSnackBar('Url Launch Failed'));
  }
}
