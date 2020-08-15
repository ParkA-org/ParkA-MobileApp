import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/Register/register.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginScreen(),
  "/EmailLogin": (BuildContext context) => LoginPage(),
  "/RegisterPage": (BuildContext context) => RegisterPage()
};
