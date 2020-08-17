import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key key, this.screenSize}) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Container(
          child: Column(children: <Widget>[
            Container(
              //This is where the back button will be
              height: screenSize.height * 0.05,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'resources/images/BlueCar.svg',
                  height: screenSize.height * 0.18,
                )),
            const Text(
              "Iniciar Sesión",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B768C)),
            ),
          ]),
        ),
      ],
    );
  }
}
