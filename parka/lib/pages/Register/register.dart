import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Header Column
            Expanded(
              flex: 0,
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: TransparentButtonWithIcon(
                    label: "Atras",
                    color: Color(0xFF0B768C),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 70,
                    color: Color(0xFF0B768C),
                  ),
                  const Text(
                    "  Crear Cuenta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B768C)),
                  ),
                ],
              ),
            ),
            //Login Column
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                color: Color(0xFF0B768C),
                child: Column(
                  children: [
                    Expanded(
                      child: ParkAInput(
                        icon: 'WhiteProfileIcon.svg',
                        text: 'Nombres',
                      ),
                    ),
                    Expanded(
                      child: ParkAInput(
                        icon: 'WhiteProfileIcon.svg',
                        text: 'Apellidos',
                      ),
                    ),
                    Expanded(
                      child: ParkAInput(
                        icon: 'Mail.svg',
                        text: 'Correo/Usuario',
                        isPassword: true,
                      ),
                    ),
                    Expanded(
                      child: ParkAInput(
                        icon: 'WhiteLockIcon.svg',
                        text: 'Contraseña',
                        isPassword: true,
                      ),
                    ),
                    Expanded(
                      child: ParkAInput(
                        icon: 'Lockcheck.svg',
                        text: 'Confirmar contraseña',
                        isPassword: true,
                      ),
                    ),
                    Expanded(
                      child: TransparentButtonWithRightIcon(
                        label: 'Continuar',
                        icon: Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
