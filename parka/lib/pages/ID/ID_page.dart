import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import 'package:ParkA/components/Cards/ID_card.dart';
import 'package:ParkA/components/Inputs/parka_datepicker.dart';
import 'package:ParkA/components/Inputs/parka_dropdown.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
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
    Size currentScreen = MediaQuery.of(context).size;
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
              flex: 6,
              child: WavyClipper.withTopWave(
                child: Container(
                    padding: EdgeInsets.fromLTRB(15, 60, 80, 10),
                    color: Color(0xFF0B768C),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ParkADropdown(
                                text: "Tipo de Documento",
                                options: ["Pasaporte", "Cedula"],
                              ),
                              ParkAInput(
                                text: "No. de Documento",
                                textSize: 14,
                                inputHeight: currentScreen.height * 0.03,
                              ),
                              ParkADatePicker(
                                text: "Fecha de nacimiento",
                                textSize: 14,
                                inputHeight: currentScreen.height * 0.03,
                              ),
                              ParkAInput(
                                text: "Nacionalidad",
                                textSize: 14,
                                inputHeight: currentScreen.height * 0.03,
                              ),
                              ParkAInput(
                                text: "Lugar de Nacimiento",
                                textSize: 14,
                                inputHeight: currentScreen.height * 0.03,
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
