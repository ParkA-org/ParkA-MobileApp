import 'dart:async';

import 'package:ParkA/pages/map/maps_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  static String routeName = "/splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ParkaColors.parkaGreen,
      child: FlareActor(
        'resources/animations/ParkA_Splash_Screen.flr',
        alignment: Alignment.center,
        fit: BoxFit.fill,
        animation: "Initial Animation",
        callback: (value) {
          Navigator.pushReplacementNamed(context, MapPage.routeName);
        },
      ),
    );
  }
}
