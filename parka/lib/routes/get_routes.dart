import 'package:ParkA/controllers/bindings/test_binding.dart';
import 'package:ParkA/pages/FilterPage/filter_page.dart';
import 'package:ParkA/pages/ID/ID_page.dart';
import 'package:ParkA/pages/ForgotPassword/forgot_password_screen.dart';
import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import 'package:ParkA/pages/ProfilePage/profile_page.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:ParkA/pages/Register/register_page.dart';
import 'package:ParkA/pages/GraphQlTest/graphql_test_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

List<GetPage> get_pages = [
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: EmailLogin.routeName,
    page: () => EmailLogin(),
    binding: UserBinding(),
  ),
  GetPage(
    name: IDPage.routeName,
    page: () => IDPage(),
  ),
  GetPage(
    name: ProfilePicPage.routeName,
    page: () => ProfilePicPage(),
  ),
  GetPage(
    name: PaymentInfoScreen.routeName,
    page: () => PaymentInfoScreen(),
  ),
  GetPage(
    name: ForgotPasswordScreen.routeName,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: RegisterPage.routeName,
    page: () => RegisterPage(),
  ),
  GetPage(
    name: MapPage.routeName,
    page: () => MapPage(),
    binding: UserBinding(),
  ),
  GetPage(
    name: GraphqlTestScreen.routeName,
    page: () => GraphqlTestScreen(),
  ),
  GetPage(
    name: FilterPage.routeName,
    page: () => FilterPage(),
  ),
  GetPage(
    name: ProfileScreen.routeName,
    page: () => ProfileScreen(),
  ),
];
