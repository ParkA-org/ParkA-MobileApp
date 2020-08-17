import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import 'package:ParkA/components/Cards/ID_card.dart';
import 'package:ParkA/components/Inputs/parka_dropdown.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:flutter/material.dart';

class IDPage extends StatefulWidget {
  IDPage({Key key}) : super(key: key);
  static const String routeName = "/IDPage";
  @override
  _IDPageState createState() => _IDPageState();
}

class _IDPageState extends State<IDPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: <Widget>[
            TransparentButtonWithIcon(
              label: "Atras",
              color: Color(0xFF0B768C),
            ),
            const Text(
              "Identificación",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B768C)),
            ),
            IDCard(),
            Expanded(
              child: Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 80, 10),
                  color: Color(0xFF0B768C),
                  child: Column(
                    children: [
                      ParkADropdown(
                        text: "Tipo de Documento",
                        options: ["Pasaporte", "Cedula"],
                      ),
                      Spacer(),
                      ParkAInput(
                        text: "No. de Documento",
                      ),
                      Spacer(),
                      ParkAInput(
                        text: "Fecha de nacimiento",
                      ),
                      Spacer(),
                      ParkAInput(
                        text: "Nacionalidad",
                      ),
                      Spacer(),
                      ParkAInput(
                        text: "Lugar de Nacimiento",
                      ),
                      Spacer(
                        flex: 10,
                      ),
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
