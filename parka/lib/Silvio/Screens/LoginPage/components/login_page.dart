import 'package:ParkA/Silvio/components/Input/parka_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          //2 Columns -> 1: Header with image and text 2: Login Form
          Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            //Header Column
            Row(children: <Widget>[
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 73, 0, 14),
                  child: SvgPicture.asset(
                    'Resources/BlueProfileIcon.svg',
                    height: 80,
                    width: 60,
                  ))
            ]),
            const Center(
              child: const Text(
                "Iniciar Sesión",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B768C)),
              ),
            ),
            //Login Column
            Container(
                margin: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                child:

                    //A Stack to have the image in the background

                    Stack(alignment: Alignment.bottomCenter, children: <Widget>[
                  SvgPicture.asset('Resources/LoginRectangle.svg',
                      allowDrawingOutsideViewBox: true),

                  //Login Form
                  Container(
                      margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Form(
                          child:
                              // 6 Columns 1 per line of the Login form and a button
                              Column(
                        children: <Widget>[
                          //Email Text
                          ParkAInput(
                            icon: "WhiteProfileIcon.svg",
                            text: "Password",
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          //Email Input
                          Material(
                              elevation: 25,
                              borderRadius: BorderRadius.circular(15),
                              shadowColor: Colors.black,
                              child: TextFormField(
                                style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(9),
                                    fillColor: Color(0xFFD7D2D2),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              )),
                          SizedBox(
                            height: 30,
                          ),

                          //Password Text
                          Row(
                            children: <Widget>[
                              SvgPicture.asset("Resources/WhiteLockIcon.svg"),
                              const Spacer(),
                              const Text("Contraseña",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              const Spacer(
                                flex: 7,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          //Password Input
                          Material(
                              elevation: 25,
                              borderRadius: BorderRadius.circular(15),
                              shadowColor: Colors.black,
                              child: TextFormField(
                                style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(9),
                                    fillColor: Color(0xFFD7D2D2),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              )),
                          SizedBox(
                            height: 28,
                          ),
                          Text(
                            "Olvide mi Contraseña",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            color: Color(0xFF63C7B2),
                            height: 60,
                            minWidth: 200,
                            elevation: 20,
                            shape: StadiumBorder(),
                            child: Text("Entrar",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onPressed: () => {},
                          )
                        ],
                      ))),
                ]))
          ],
        ),
      ),
    );
  }
}
