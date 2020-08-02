import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkA',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ParkA'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
                      'Resources/BlueCar.svg',
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

                      Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
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
                                Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        "Resources/WhiteProfileIcon.svg"),
                                    const Spacer(),
                                    const Text("Correo/Usuario",
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
                                    SvgPicture.asset(
                                        "Resources/WhiteLockIcon.svg"),
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
      ),
    );
  }
}
