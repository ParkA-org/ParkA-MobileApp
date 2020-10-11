import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Cards/ID_card.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Inputs/parka_datepicker.dart';
import 'package:ParkA/components/Inputs/parka_dropdown.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/data_models/country/country_data_model.dart';
import 'package:ParkA/data_models/nationality/nationality_data_model.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:ParkA/pages/Register/register_page.dart';
import 'package:ParkA/use-cases/country/country_use_cases.dart';
import 'package:ParkA/use-cases/nationality/nationality_use_cases.dart';
import 'package:ParkA/use-cases/user/dtos/user_registration_dto.dart';
import 'package:ParkA/use-cases/user/user_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  bool nationalitiesLoading;
  List<Nationality> nationalities;
  List<String> nationalityOptions;
  List<Country> countries;
  bool countriesLoading;
  List<String> placeOfBirthOptions;
  List<String> documentTypeOptions;

  Future getAllNationalities() async {
    List<Nationality> _nationalities =
        await NationalityUseCases.getAllNationalities();

    setState(() {
      this.nationalities = _nationalities;
      this.nationalityOptions = List.from(_nationalities.map((e) => e.name));
      this.nationalitiesLoading = false;
    });
  }

  Future getAllCountries() async {
    List<Country> _countries = await CountryUseCases.getAllCountries();

    setState(() {
      this.countries = _countries;
      this.placeOfBirthOptions = List.from(_countries.map((e) => e.name));
      this.countriesLoading = false;
    });
  }

  dynamic onChanged(DateTime value, List<int> index) {
    userRegistrationForm.createUserInformationDto.birthDate =
        value.toIso8601String();
    setState(() {
      this.dateOfBirth = value;
    });
  }

  @override
  void initState() {
    super.initState();
    this.countriesLoading = true;
    this.nationalitiesLoading = true;

    getAllNationalities();
    getAllCountries();
    documentTypeOptions = ["Cedula", "Pasaporte"];
  }

  @override
  Widget build(BuildContext context) {
    UserRegistrationForm userRegistrationForm =
        ModalRoute.of(context).settings.arguments;
    Size currentScreen = MediaQuery.of(context).size;

    void nextButtonHandler(bool _omit) {
      userRegistrationForm.createUserInformationDto.documentNumber =
          this.docNumber;
      //doc number must be 11 digits
      print(userRegistrationForm.createUserInformationDto.documentNumber);
      print(userRegistrationForm.createUserInformationDto.birthDate);
      print(userRegistrationForm.createUserInformationDto.nationality);
      print(userRegistrationForm.createUserInformationDto.placeOfBirth);
      print(userRegistrationForm.createUserInformationDto.telephonNumber);

      UserUseCases.registerUser(userRegistrationForm);
      Navigator.pushNamed(context, MapPage.routeName);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this.nationalitiesLoading || this.countriesLoading,
          child: this.nationalitiesLoading || this.countriesLoading
              ? Container()
              : Container(
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
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 36.0),
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
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: constraints.maxHeight,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ParkADropdown(
                                        text: "Tipo de Documento",
                                        textSize: 16.0,
                                        selectedItem: docType,
                                        options: documentTypeOptions,
                                        height: currentScreen.height * 0.03,
                                        width: currentScreen.width * 0.8,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              this.docType = this
                                                  .documentTypeOptions[value];
                                            },
                                          );
                                        },
                                      ),
                                      ParkAInput(
                                        text: "No. de Documento",
                                        inputHeight:
                                            currentScreen.height * 0.03,
                                        inputWidth: currentScreen.width * 0.8,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              this.docNumber = value;
                                              userRegistrationForm
                                                  .createUserInformationDto
                                                  .documentNumber = value;
                                            },
                                          );
                                        },
                                      ),
                                      ParkADatePicker(
                                        text: "Fecha de nacimiento",
                                        textSize: 16,
                                        selectedDate: dateOfBirth,
                                        inputHeight:
                                            currentScreen.height * 0.03,
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
                                              this.nationality = this
                                                  .nationalities[value]
                                                  .name;
                                              userRegistrationForm
                                                      .createUserInformationDto
                                                      .nationality =
                                                  this.nationalities[value].id;
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
                                                  this.countries[value].name;
                                              userRegistrationForm
                                                      .createUserInformationDto
                                                      .placeOfBirth =
                                                  this.countries[value].id;
                                            },
                                          );
                                        },
                                      ),
                                      TransparentButton(
                                        label: "Continuar",
                                        color: Colors.white,
                                        trailingIconData:
                                            Icons.arrow_forward_ios,
                                        buttonTextStyle:
                                            kParkaBigButtonTextStyle,
                                        onTapHandler: () {
                                          nextButtonHandler(true);
                                        },
                                      ),
                                      TransparentButton(
                                        label: "Omitir",
                                        color: ParkaColors.parkaLightGreen,
                                        buttonTextStyle: kParkaInputDefaultSyle,
                                        onTapHandler: () {
                                          nextButtonHandler(false);
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
      ),
    );
  }
}
