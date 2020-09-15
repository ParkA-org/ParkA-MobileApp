import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Cards/ID_card.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Inputs/parka_datepicker.dart';
import 'package:ParkA/components/Inputs/parka_dropdown.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IDPage extends StatefulWidget {
  IDPage({Key key}) : super(key: key);
  Object arguments;
  static const String routeName = "/IDPage";
  @override
  _IDPageState createState() => _IDPageState();
}

class _IDPageState extends State<IDPage> {
  String docNumber;

  DateTime dateOfBirth;

  String docType;

  String nationality;

  String placeOfBirth;

  @override
  Widget build(BuildContext context) {
    dynamic onChanged(DateTime value, List<int> index) {
      setState(() {
        this.dateOfBirth = value;
      });
    }

    Map<String, dynamic> createAccount =
        ModalRoute.of(context).settings.arguments;
    print(createAccount["countries"]);
    Size currentScreen = MediaQuery.of(context).size;
    List<String> nationalityOptions = createAccount["countries"];
    List<String> docTypeOptions = createAccount["typedocuments"];
    List<String> placeOfBirthOptions = [
      "Santo Domingo",
      "La Romana",
      "Espagetti"
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              ParkaHeader(),
              Text(
                "Identificación",
                textAlign: TextAlign.center,
                style: kParkaPageTitleTextStyle,
              ),
              IDCard(
                docNumber: this.docNumber,
                dateOfBirth: this.dateOfBirth,
                docType: this.docType,
                nationality: this.nationality,
                placeOfBirth: this.placeOfBirth,
              ),
              Expanded(
                child: WavyClipper.withTopWave(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
                    color: ParkaColors.parkaGreen,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ParkADropdown(
                                    text: "Tipo de Documento",
                                    textSize: 16.0,
                                    selectedItem: docType,
                                    options: docTypeOptions,
                                    height: currentScreen.height * 0.03,
                                    width: currentScreen.width * 0.8,
                                    onChanged: (value) {
                                      setState(() {
                                        createAccount["idpage"]
                                                ["typeDocument"] =
                                            docTypeOptions[value];
                                      });
                                    }),
                                ParkAInput(
                                  text: "No. de Documento",
                                  inputHeight: currentScreen.height * 0.03,
                                  inputWidth: currentScreen.width * 0.8,
                                  onChanged: (value) {
                                    setState(() {
                                      createAccount["idpage"]["document"] =
                                          value;
                                    });
                                  },
                                ),
                                ParkADatePicker(
                                  text: "Fecha de nacimiento",
                                  textSize: 16,
                                  selectedDate: dateOfBirth,
                                  inputHeight: currentScreen.height * 0.03,
                                  inputWidth: currentScreen.width * 0.8,
                                  onChanged: onChanged,
                                ),
                                ParkADropdown(
                                    text: "Nacionalidad",
                                    textSize: 16.0,
                                    selectedItem: nationality,
                                    options: nationalityOptions,
                                    height: currentScreen.height * 0.03,
                                    width: currentScreen.width * 0.8,
                                    onChanged: (value) {
                                      setState(() {
                                        createAccount["idpage"]["nationality"] =
                                            nationalityOptions[value];
                                      });
                                    }),
                                ParkADropdown(
                                    text: "Lugar de Nacimiento",
                                    textSize: 16.0,
                                    selectedItem: placeOfBirth,
                                    options: placeOfBirthOptions,
                                    height: currentScreen.height * 0.03,
                                    width: currentScreen.width * 0.8,
                                    onChanged: (value) {
                                      setState(() {
                                        createAccount["idpage"]
                                                ["Placeofbirth"] =
                                            placeOfBirthOptions[value];
                                      });
                                    }),
                                TransparentButton(
                                  label: "Continuar",
                                  color: Colors.white,
                                  buttonTextStyle: kParkaBigButtonTextStyle,
                                  onTapHandler: () => {
                                    createAccount["idpage"]["datebirth"] =
                                        this.dateOfBirth,
                                    Navigator.pushNamed(
                                      context,
                                      PaymentInfoScreen.routeName,
                                      arguments: createAccount,
                                    )
                                  },
                                ),
                                TransparentButton(
                                  label: "Omitir",
                                  color: ParkaColors.parkaLightGreen,
                                  buttonTextStyle: kParkaInputDefaultSyle,
                                  onTapHandler: () => {
                                    createAccount["idpage"]["datebirth"] =
                                        "null",
                                    Navigator.pushNamed(
                                      context,
                                      PaymentInfoScreen.routeName,
                                      arguments: createAccount,
                                    )
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
