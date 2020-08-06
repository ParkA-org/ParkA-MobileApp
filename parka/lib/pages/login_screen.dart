import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_button.dart';
import "../components/transparent_button.dart";
import '../utils/parkaIcons.dart';
import "../utils/curves_painter.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: WavyHeaderImage(
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
                    TransparentButton(
                      label: "Iniciar Sesion con Correo",
                    ),
                    TransparentButton(
                      label: "Registrarse",
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}