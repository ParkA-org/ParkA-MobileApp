import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/components/Utils/functions.dart';
import 'package:ParkA/components/Utils/styles/inputs.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';

import 'components/forgot_password_alert_dialog.dart';

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Olvidaste tu contraseña?",
                      textAlign: TextAlign.center,
                      style: kParkaPageTitleTextStyle,
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
                      decoration: kInputStyle.copyWith(
                        hintText: "Email",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: WavyClipper.withTopWave(
                child: Container(
                  color: Color(0xFF0B768C),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedButton(
                        label: "Enviar",
                        color: Color(0xFF63C7B2),
                        hasIcon: false,
                        hasShadow: true,
                        width: 150.0,
                        onTapHandler: () {
                          return buildShowDialog(
                            context,
                            ForgotPasswordAlertDialog(),
                          );
                        },
                      ),
                      TransparentButton(
                        label: "Cancelar",
                        color: ParkaColors.parkaLightGreen,
                        onTapHandler: () => Navigator.pop(context),
                        buttonTextStyle: kParkaInputDefaultSyle,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
