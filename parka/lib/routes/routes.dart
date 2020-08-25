<<<<<<< HEAD
import 'package:ParkA/pages/FilterPage/filter_page.dart';
=======
import 'package:ParkA/pages/ID/ID_page.dart';
import 'package:ParkA/pages/ForgotPassword/forgot_password_screen.dart';
>>>>>>> cb8a4e959941f46a8c973849c1c9a0475c4c3811
import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:ParkA/pages/Register/register_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
<<<<<<< HEAD
  "/": (BuildContext context) => LoginScreen(),
  "/EmailLogin": (BuildContext context) => LoginPage(),
  "/RegisterPage": (BuildContext context) => RegisterPage(),
  FilterPage.routeName: (BuildContext context) => FilterPage(),
=======
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  EmailLogin.routeName: (BuildContext context) => EmailLogin(),
  IDPage.routeName: (BuildContext context) => IDPage(),
  ProfilePicPage.routeName: (BuildContext context) => ProfilePicPage(),
  PaymentInfoScreen.routeName: (BuildContext context) => PaymentInfoScreen(),
  ForgotPasswordScreen.routeName: (BuildContext context) =>
      ForgotPasswordScreen(),
  RegisterPage.routeName: (BuildContext context) => RegisterPage(),
>>>>>>> cb8a4e959941f46a8c973849c1c9a0475c4c3811
};
