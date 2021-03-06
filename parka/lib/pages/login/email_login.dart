import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/pages/login/components/login_form.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'components/login_header.dart';

class EmailLogin extends StatelessWidget {
  EmailLogin({Key key}) : super(key: key);
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
