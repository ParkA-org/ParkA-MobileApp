<<<<<<< HEAD
import 'package:ParkA/pages/MapPage/maps_page.dart';
=======

import 'package:ParkA/components/Utils/graphql/graphql_client.dart';
import 'package:ParkA/pages/FilterPage/filter_page.dart';
import 'package:ParkA/pages/ForgotPassword/forgot_password_screen.dart';
import 'package:ParkA/pages/GraphQlTest/graphql_test_page.dart';
import 'package:ParkA/pages/ID/ID_page.dart';
import 'package:ParkA/pages/Login/Components/login_form.dart';
import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:ParkA/pages/Register/register_page.dart';
>>>>>>> dev

import 'package:flutter/material.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ParkaGraphqlClient parkaGraphqlClient = new ParkaGraphqlClient();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkA',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
<<<<<<< HEAD
      initialRoute: MapPage.routeName,
=======
      initialRoute: FilterPage.routeName,
>>>>>>> dev
    );
  }
}
