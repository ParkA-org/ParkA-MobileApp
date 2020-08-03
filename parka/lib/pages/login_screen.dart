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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Bienvenido a ParkA",
                      textAlign: TextAlign.center,
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
                    Container(
                      height: 32.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF3B5998),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset("images/facebook_logo.png"),
                            Text(
                              "Iniciar sesion con Facebook",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Montserrat",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
