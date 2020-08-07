import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child:
            //2 Columns -> 1: Header with image and text 2: Login Form

            Container(
          height: currentScreen.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Header Column
              Row(children: <Widget>[
                Container(
                    child: SvgPicture.asset(
                  'resources/images/BlueCar.svg',
                  height: currentScreen.height * 0.18,
                ))
              ]),
              const Text(
                "Iniciar Sesión",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B768C)),
              ),
              //Login Column
              Container(
                  margin:
                      EdgeInsets.fromLTRB(0, currentScreen.height * 0.01, 0, 0),
                  child:
                      //A Stack to have the image in the background
                      Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                        SvgPicture.asset(
                          'resources/images/LoginRectangle.svg',
                          allowDrawingOutsideViewBox: true,
                          height: currentScreen.height * 0.52,
                        ),

                        //Login Form
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              currentScreen.height * 0.05,
                              currentScreen.height * 0.1,
                              currentScreen.height * 0.05,
                              0),
                          child: Column(
                            children: [
                              ParkAInput(
                                icon: 'WhiteProfileIcon.svg',
                                text: 'Correo',
                              ),
                              SizedBox(
                                height: currentScreen.height * 0.005,
                              ),
                              ParkAInput(
                                icon: 'WhiteProfileIcon.svg',
                                text: 'Correo',
                              ),
                              SizedBox(
                                height: currentScreen.height * 0.005,
                              ),
                              Text(
                                "Olvide mi contraseña",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: currentScreen.height * 0.03,
                              ),
                              MaterialButton(
                                color: Color(0xFF63C7B2),
                                height: currentScreen.height * 0.085,
                                minWidth: currentScreen.width * 0.5,
                                elevation: 20,
                                shape: StadiumBorder(),
                                child: Text("Entrar",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                onPressed: () => {},
                              ),
                            ],
                          ),
                        ),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
