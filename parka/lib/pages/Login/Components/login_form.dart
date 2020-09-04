import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/pages/ForgotPassword/forgot_password_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key, this.screenSize}) : super(key: key);

  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: WavyClipper.withTopWave(
        child: Container(
            color: Color(0xFF0B768C),
            child:
                //Login inputs container
                Container(
              margin: EdgeInsets.fromLTRB(screenSize.height * 0.05,
                  screenSize.height * 0.07, screenSize.height * 0.05, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  ParkAInput(
                    icon: 'WhiteProfileIcon.svg',
                    text: 'Correo / Usuario',
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  ParkAInput(
                    icon: 'WhiteLockIcon.svg',
                    text: 'Contraseña',
                    isPassword: true,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName);
                    },
                    child: Text(
                      "Olvide mi contraseña",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  MaterialButton(
                    color: Color(0xFF63C7B2),
                    height: screenSize.height * 0.085,
                    minWidth: screenSize.width * 0.5,
                    elevation: 20,
                    shape: StadiumBorder(),
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
