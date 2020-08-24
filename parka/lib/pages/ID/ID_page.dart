import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Buttons/transparent_button.dart';
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
              child: WavyClipper.withTopWave(
                child: Container(
                    padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
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
                                height: currentScreen.height * 0.03,
                                width: currentScreen.width * 0.8,
                              ),
                              ParkAInput(
                                text: "No. de Documento",
                                textSize: 14,
                                inputHeight: currentScreen.height * 0.03,
                                inputWidth: currentScreen.width * 0.8,
                              ),
                              ParkADatePicker(
                                text: "Fecha de nacimiento",
                                textSize: 14,
                                inputHeight: currentScreen.height * 0.03,
                                inputWidth: currentScreen.width * 0.8,
                              ),
                              ParkADropdown(
                                text: "Nacionalidad",
                                options: ["Italiano", "Dominicano"],
                                height: currentScreen.height * 0.03,
                                width: currentScreen.width * 0.8,
                              ),
                              ParkADropdown(
                                text: "Lugar de Nacimiento",
                                options: [
                                  "Santo Domingo",
                                  "La Romana",
                                  "Espagetti"
                                ],
                                height: currentScreen.height * 0.03,
                                width: currentScreen.width * 0.8,
                              ),
                              TransparentButton(
                                  label: "Continuar",
                                  buttonTextStyle: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: "Montserrat",
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold)),
                              TransparentButton(
                                  label: "Omitir",
                                  //TODO Navigate forward without validation
                                  onTapHandler: () => {},
                                  buttonTextStyle: TextStyle(
                                      color: Color(0xFFB3E8FF),
                                      fontFamily: "Montserrat",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold))
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
