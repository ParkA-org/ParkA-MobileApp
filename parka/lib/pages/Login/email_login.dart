import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'Components/login_form.dart';
import 'Components/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
            //2 Columns -> 1: Header with image and text 2: Login Form

            Container(
          height: currentScreen.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Header Column
              LoginHeader(screenSize: currentScreen),
              //Login Column
              LoginForm(screenSize: currentScreen),
            ],
          ),
        ),
      ),
    );
  }
}
