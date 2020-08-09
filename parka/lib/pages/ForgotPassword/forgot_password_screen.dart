import 'package:ParkA/components/Utils/curves_painter.dart';
import "package:flutter/material.dart";

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "/forgotPassword";

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF0B768C),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: WavyHeaderImage(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Olvidaste tu contraseña?",
                      style: TextStyle(
                        color: Color(0xFF0B768C),
                        fontSize: 32.0,
                      ),
                    ),
                    Text(
                      "Ingresa tu correo electronico y te enviaremos un mensaje con las instrucciones para recuperar tu cuenta",
                      style: TextStyle(
                        color: Color(0xFF0B768C),
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          this.email = value;
                        });
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
