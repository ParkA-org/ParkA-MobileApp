import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginScreen(),
  "/EmailLogin": (BuildContext context) => LoginPage(),
  PaymentInfoScreen.routeName: (BuildContext context) => PaymentInfoScreen(),
};
