import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_button.dart';
import "../components/parkaIcons.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Color(0xFF0B768C),
              child: Icon(
                ParkaIcons.parkaCar,
                color: Colors.white,
                size: 150.0,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomPaint(),
                    Text(
                      "Bienvenido a ParkA",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF0B768C),
                          fontSize: 48.0,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Simplificando la busqueda y alquiler de parqueos",
                      style: TextStyle(
                          color: Color(0xFF0B768C),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold),
                    ),
                    RoundedButton(
                      color: Color(0xFF3B5998),
                      icon: FontAwesomeIcons.facebookF,
                      label: "Iniciar sesion con Facebook",
                    ),
                    RoundedButton(
                      color: Color(0xFFFF3E30),
                      icon: FontAwesomeIcons.google,
                      label: "Iniciar sesion con Google",
                    ),
                    Text(
                      "Iniciar Sesion con Correo",
                      style: TextStyle(
                          color: Color(0xFF0B768C),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Registrarse",
                      style: TextStyle(
                          color: Color(0xFF0B768C),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
