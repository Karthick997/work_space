import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var heightSpace = const SizedBox(
  height: 10,
);
var widthSpace = const SizedBox(
  width: 10,
);

int timeDuration = 30;
int page = 1;
int limit = 20;

SharedPreferences? prefs;

// Color
Color primaryColor = const Color(0xff285C4F);
Color secondaryColor = const Color(0xffE9CE96);
Color whiteColor = Colors.white;
Color textColor = const Color(0xff767977);
Color blackColor = Colors.black;
Color nextColor = const Color(0xff172D2B);
Color forgetPasswordTextColor = const Color(0xffBEBCBC);
Color dividerLineColor = const Color(0xffE5E5E5);
Color resendTextColor = const Color(0xffFFA800);
Color calenderScColor = const Color(0xffBBFFEC);
Color lowContainerColor = const Color(0xffE7C6C6);
Color mediumContainerColor = const Color(0xffE7E2B7);
Color highContainerColor = const Color(0xffBEEDC3);
