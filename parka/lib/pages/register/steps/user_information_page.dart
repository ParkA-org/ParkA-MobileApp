import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/cards/ID_card.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/inputs/parka_datepicker.dart';
import 'package:ParkA/components/inputs/parka_dropdown.dart';
import 'package:ParkA/components/inputs/parka_input.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/controllers/login/login_controller.dart';
import 'package:ParkA/controllers/register-user-form/register_user_controller.dart';
import 'package:ParkA/data/data-models/country/country_data_model.dart';
import 'package:ParkA/data/data-models/nationality/nationality_data_model.dart';
import 'package:ParkA/data/use-cases/country/country_use_cases.dart';
import 'package:ParkA/data/use-cases/nationality/nationality_use_cases.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:ParkA/pages/confirm-account/confirm_account_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/form-validations/register_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UserInformationPage extends StatefulWidget {
  UserInformationPage({Key key}) : super(key: key);

  static const String routeName = "/UserInformationPage";
  @override
  _UserInformationPageState createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  final _registerUSerController = Get.find<RegisterUSerController>();
  final _gqlClient = Get.find<GraphqlClientController>();

  final LoginController _loginController = Get.find<LoginController>();

  String docType;
  bool _loading;

  List<Nationality> nationalities;
  List<String> nationalityOptions;
  List<Country> countries;

  List<String> placeOfBirthOptions;
  List<String> documentTypeOptions = ["Cedula", "Pasaporte"];

  Future getAllNationalities() async {
    List<Nationality> _nationalities =
        await NationalityUseCases.getAllNationalities();
    this.nationalities = _nationalities;
    this.nationalityOptions = List.from(_nationalities.map((e) => e.name));
  }

  Future getAllCountries() async {
    List<Country> _countries = await CountryUseCases.getAllCountries();

    this.countries = _countries;
    this.placeOfBirthOptions = List.from(_countries.map((e) => e.name));
  }

  void getFormData() async {
    await getAllNationalities();
    await getAllCountries();

    setState(() {
      this._loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this._loading = true;

    getFormData();
  }

  void nextButtonHandler(bool _omit) async {
    final _check =
        validateUserInformation(_registerUSerController.registrationForm);

    if (!_check) {
      Get.snackbar(
        "Error",
        "Verifica tus datos",
        margin: EdgeInsets.all(8.0),
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
      return;
    }

    final userRegistrationResult = await UserUseCases.registerUser(
        _registerUSerController.registrationForm);

    if (userRegistrationResult) {
      _loginController
          .setPassword(_registerUSerController.createUserDto.password);
      Navigator.pushNamed(context, ConfirmAccountPage.routeName);
    } else {
      Get.snackbar(
        "Error",
        "Revisa los datos ingresados",
        margin: EdgeInsets.all(8.0),
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this._loading,
          child: this._loading
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
                          child: Obx(
                            () => IDCard(
                              docNumber: _registerUSerController
                                  .createUserInformationDto.documentNumber,
                              dateOfBirth: _registerUSerController
                                  .createUserInformationDto.birthDate,
                              docType: this.docType,
                              nationality: _registerUSerController
                                  .createUserInformationDto.nationality?.name,
                              placeOfBirth: _registerUSerController
                                  .createUserInformationDto.placeOfBirth?.name,
                            ),
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
                                        onChanged: (String _documentNumber) {
                                          _registerUSerController
                                              .setDocumentNumber(
                                                  _documentNumber);
                                        },
                                      ),
                                      Obx(
                                        () => ParkADatePicker(
                                          text: "Fecha de nacimiento",
                                          textSize: 16,
                                          selectedDate: _registerUSerController
                                              .createUserInformationDto
                                              .birthDate,
                                          inputHeight:
                                              currentScreen.height * 0.03,
                                          inputWidth: currentScreen.width * 0.8,
                                          onChanged: (DateTime _birthDate,
                                              List<int> index) {
                                            _registerUSerController
                                                .setBirthDate(_birthDate);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => ParkADropdown(
                                          text: "Nacionalidad",
                                          textSize: 16.0,
                                          selectedItem: _registerUSerController
                                                  .createUserInformationDto
                                                  .nationality
                                                  ?.name ??
                                              "",
                                          options: nationalityOptions,
                                          height: currentScreen.height * 0.03,
                                          width: currentScreen.width * 0.8,
                                          onChanged: (int value) {
                                            Nationality _nationality =
                                                this.nationalities[value];
                                            _registerUSerController
                                                .setNationality(_nationality);
                                          },
                                        ),
                                      ),
                                      Obx(
                                        () => ParkADropdown(
                                          text: "Lugar de Nacimiento",
                                          textSize: 16.0,
                                          selectedItem: _registerUSerController
                                                  .createUserInformationDto
                                                  .placeOfBirth
                                                  ?.name ??
                                              "",
                                          options: placeOfBirthOptions,
                                          height: currentScreen.height * 0.03,
                                          width: currentScreen.width * 0.8,
                                          onChanged: (int value) {
                                            Country _placeOfBirth =
                                                this.countries[value];
                                            _registerUSerController
                                                .setPlaceOfBirth(_placeOfBirth);
                                          },
                                        ),
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
