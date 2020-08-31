import 'package:ParkA/pages/FilterPage/filter_page.dart';
import 'package:ParkA/pages/ID/ID_page.dart';
import 'package:ParkA/pages/ForgotPassword/forgot_password_screen.dart';
import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:ParkA/pages/Register/register_page.dart';
import 'package:ParkA/pages/GraphQlTest/graphql_test_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  EmailLogin.routeName: (BuildContext context) => EmailLogin(),
  IDPage.routeName: (BuildContext context) => IDPage(),
  ProfilePicPage.routeName: (BuildContext context) => ProfilePicPage(),
  PaymentInfoScreen.routeName: (BuildContext context) => PaymentInfoScreen(),
  ForgotPasswordScreen.routeName: (BuildContext context) =>
      ForgotPasswordScreen(),
  RegisterPage.routeName: (BuildContext context) => RegisterPage(),
  GraphqlTestScreen.routeName: (BuildContext context) => GraphqlTestScreen(),
  FilterPage.routeName: (BuildContext context) => FilterPage(),
};
