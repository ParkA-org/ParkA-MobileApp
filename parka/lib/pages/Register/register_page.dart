import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:flutter/material.dart';
import "package:ParkA/components/Utils/styles/text.dart";

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
                child: TransparentButtonWithIcon(
                  label: "Atras",
                  color: Color(0xFF0B768C),
                  onTapHandler: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 70,
                    color: Color(0xFF0B768C),
                  ),
                  Spacer(),
                  Text(
                    "Crear Cuenta",
                    textAlign: TextAlign.center,
                    style: kParkaPageTitleTextStyle,
                  ),
                  Spacer(
                    flex: 3,
                  )
                ],
              ),
            ),
            //Login Column
            Expanded(
              flex: 6,
              // fit: FlexFit.tight,
              child: WavyClipper.withTopWave(
                child: Container(
                  padding: EdgeInsets.fromLTRB(42, 20, 42, 15),
                  color: Color(0xFF0B768C),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              SizedBox(
                                height: 10,
                              ),
                              TransparentButtonWithRightIcon(
                                label: 'Continuar',
                                icon: Icons.arrow_forward_ios,
                                color: Colors.white,
                                onTapHandler: () {
                                  Navigator.pushNamed(
                                      context, ProfilePicPage.routeName);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
