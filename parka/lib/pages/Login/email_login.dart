import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:flutter/material.dart';

import 'Components/login_form.dart';
import 'Components/login_header.dart';

class EmailLogin extends StatelessWidget {
  const EmailLogin({Key key}) : super(key: key);
  static const String routeName = "/EmailLogin";

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              //2 Columns -> 1: Header with image and text 2: Login Form

              Container(
            height: currentScreen.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ParkaHeader(
                  color: ParkaColors.parkaGreen,
                ),
                //Header Column
                LoginHeader(screenSize: currentScreen),
                //Login Column
                LoginForm(screenSize: currentScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
