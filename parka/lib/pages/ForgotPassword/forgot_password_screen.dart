import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: WavyHeaderImage(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Olvidaste tu contraseña?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF0B768C),
                              fontSize: 32.0,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        ),
                        SvgPicture.asset(
                          'resources/images/ForgotPasswordIcon.svg',
                          allowDrawingOutsideViewBox: true,
                          height: 150.0,
                        ),
                        Text(
                          "Ingresa tu correo electronico y te enviaremos un mensaje con las instrucciones para recuperar tu cuenta",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color(0xFF0B768C),
                          ),
                        ),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              this.email = value;
                            });
                          },
                          decoration: kInputStyle,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton(
                    label: "Enviar",
                    color: Color(0xFF63C7B2),
                    hasIcon: false,
                    width: 150.0,
                  ),
                  TransparentButton(
                    label: "Cancelar",
                    buttonTextStyle: TextStyle(
                        color: Color(0xFFB3E8FF),
                        fontFamily: "Montserrat",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const kInputStyle = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  fillColor: Color(0xFFD7D2D2),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
