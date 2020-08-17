import 'package:ParkA/pages/ID/ID_page.dart';
import 'package:ParkA/pages/ForgotPassword/forgot_password_screen.dart';
import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginScreen(),
  "/EmailLogin": (BuildContext context) => EmailLogin(),
  "/IDPage": (BuildContext context) => IDPage(),
  "/ProfilePic": (BuildContext context) => ProfilePicPage(),
  PaymentInfoScreen.routeName: (BuildContext context) => PaymentInfoScreen(),
  ForgotPasswordScreen.routeName: (BuildContext context) =>
      ForgotPasswordScreen(),
};
