import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFF0B768C),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Text(
                    "Bienvenido a ParkA",
                    style: TextStyle(
                        color: Color(0xFF0B768C),
                        fontSize: 48.0,
                        fontFamily: "Righteous",
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Simplificando la busqueda y alquiler de parqueos")
                ],
              ))
        ],
      ),
    );
  }
}
