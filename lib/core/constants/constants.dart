import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff00acac);
const kTextGrey = Color(0XFF707478);
const kSystemPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 0);

void errorSnackBar(BuildContext context, String message,
    {Duration duration = const Duration(seconds: 8)}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(message),
    duration: duration,
  ));
}

const String cpimsApiUrl = "https://dev.cpims.net/api/";
const String mobileEndpoint = "https://dev.cpims.net/mobile/";

enum RadioButtonOptions { yes, no, na }

const String registerUrl = "https://test.cpims.net/accounts/request/";
const String forgotPasswordUrl =
    "https://test.cpims.net/accounts/password-reset/";
