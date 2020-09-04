import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Register/register_page.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/Utils/parkaIcons.dart';
import '../../components/Utils/curves_painter.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: WavyClipper.withBottomWave(
              child: Container(
                alignment: Alignment.centerLeft,
                color: Color(0xFF0B768C),
                child: Icon(
                  ParkaIcons.parkaCar,
                  color: Colors.white,
                  size: 130.0,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Bienvenido a ParkA",
                      // textAlign: TextAlign.center,
                      style: kParkaBigTitleTextStyle,
                    ),
                    Text(
                      "Simplificando la busqueda y alquiler de parqueos",
                      style: kParkaTextBaseStyle,
                    ),
                    RoundedButton(
                      color: Color(0xFF3B5998),
                      icon: FontAwesomeIcons.facebookF,
                      label: "Iniciar sesion con Facebook",
                      hasIcon: true,
                      hasShadow: false,
                    ),
                    RoundedButton(
                      color: Color(0xFFFF3E30),
                      icon: FontAwesomeIcons.google,
                      label: "Iniciar sesion con Google",
                      hasIcon: true,
                      hasShadow: false,
                    ),
                    TransparentButton(
                      label: "Iniciar Sesion con Correo",
                      buttonTextStyle: kParkaTextBaseStyle,
                      onTapHandler: () {
                        Navigator.pushNamed(context, EmailLogin.routeName);
                      },
                    ),
                    TransparentButton(
                      label: "Registrarse",
                      buttonTextStyle: kParkaTextBaseStyle,
                      onTapHandler: () {
                        Navigator.pushNamed(context, RegisterPage.routeName);
                      },
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
