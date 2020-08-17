import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);
  static const String routeName = "/RegisterPage";

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Header Column
            Expanded(
              flex: 0,
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const TransparentButtonWithIcon(
                    label: "Atras",
                    color: Color(0xFF0B768C),
                  )),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 70,
                    color: Color(0xFF0B768C),
                  ),
                  const Spacer(),
                  const Text(
                    "Crear Cuenta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B768C)),
                  ),
                  const Spacer(
                    flex: 3,
                  )
                ],
              ),
            ),
            //Login Column
            Expanded(
              flex: 6,
              child: WavyClipper.withTopWave(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 42.0),
                  color: Color(0xFF0B768C),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: currentScreen.height * 0.02,
                        ),
                        ParkAInput(
                          icon: 'WhiteProfileIcon.svg',
                          text: 'Nombres',
                        ),
                        ParkAInput(
                          icon: 'WhiteProfileIcon.svg',
                          text: 'Apellidos',
                        ),
                        ParkAInput(
                          icon: 'Mail.svg',
                          text: 'Correo/Usuario',
                          isPassword: true,
                        ),
                        ParkAInput(
                          icon: 'WhiteLockIcon.svg',
                          text: 'Contraseña',
                          isPassword: true,
                        ),
                        ParkAInput(
                          icon: 'Lockcheck.svg',
                          text: 'Confirmar contraseña',
                          isPassword: true,
                        ),
                        TransparentButtonWithRightIcon(
                          label: 'Continuar',
                          icon: Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
