import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Cards/ID_card.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Inputs/parka_datepicker.dart';
import 'package:ParkA/components/Inputs/parka_dropdown.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
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
    Size currentScreen = MediaQuery.of(context).size;
    List<String> nationalityOptions = createAccount["countries"];
    List<String> docTypeOptions = createAccount["typedocuments"];
    List<String> placeOfBirthOptions = [
      "Santo Domingo",
      "La Romana",
      "Espagetti"
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 0,
                child: ParkaHeader(
                  color: ParkaColors.parkaGreen,
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  "Identificación",
                  textAlign: TextAlign.center,
                  style: kParkaPageTitleTextStyle,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: IDCard(
                    docNumber: this.docNumber,
                    dateOfBirth: this.dateOfBirth,
                    docType: this.docType,
                    nationality: this.nationality,
                    placeOfBirth: this.placeOfBirth,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: ParkaColors.parkaGreen,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        16.0,
                      ),
                      topRight: Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: Column(
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
                                  setState(
                                    () {
                                      this.docType = docTypeOptions[value];
                                      createAccount["idpage"]["typeDocument"] =
                                          docTypeOptions[value];
                                    },
                                  );
                                },
                              ),
                              ParkAInput(
                                text: "No. de Documento",
                                inputHeight: currentScreen.height * 0.03,
                                inputWidth: currentScreen.width * 0.8,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      this.docNumber = value;
                                      createAccount["idpage"]["document"] =
                                          value;
                                    },
                                  );
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
                                  setState(
                                    () {
                                      this.nationality =
                                          nationalityOptions[value];
                                      createAccount["idpage"]["nationality"] =
                                          nationalityOptions[value];
                                    },
                                  );
                                },
                              ),
                              ParkADropdown(
                                text: "Lugar de Nacimiento",
                                textSize: 16.0,
                                selectedItem: placeOfBirth,
                                options: placeOfBirthOptions,
                                height: currentScreen.height * 0.03,
                                width: currentScreen.width * 0.8,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      this.placeOfBirth =
                                          placeOfBirthOptions[value];
                                      createAccount["idpage"]["Placeofbirth"] =
                                          placeOfBirthOptions[value];
                                    },
                                  );
                                },
                              ),
                              TransparentButton(
                                label: "Continuar",
                                color: Colors.white,
                                trailingIconData: Icons.arrow_forward_ios,
                                buttonTextStyle: kParkaBigButtonTextStyle,
                                onTapHandler: () => {
                                  print(dateOfBirth),
                                  createAccount["idpage"]["datebirth"] =
                                      this.dateOfBirth.toString().split(" ")[0],
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
                                  createAccount["idpage"]["datebirth"] = "null",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
