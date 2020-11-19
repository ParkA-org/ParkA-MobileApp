import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/headers/parka_header_symbol.dart';
import 'package:ParkA/components/inputs/parka_dropdown.dart';
import 'package:ParkA/components/inputs/parka_dropdown_profile.dart';
import 'package:ParkA/components/inputs/parka_edit_text_field.dart';
import 'package:ParkA/components/inputs/parka_edit_text_field_profile.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/data/data-models/country/country_data_model.dart';
import 'package:ParkA/data/data-models/information/information_data_model.dart';
import 'package:ParkA/data/data-models/nationality/nationality_data_model.dart';
import 'package:ParkA/data/use-cases/country/country_use_cases.dart';
import 'package:ParkA/data/use-cases/nationality/nationality_use_cases.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditUserProfileInformationPage extends StatefulWidget {
  static String routeName = "edit-user-profile-page";

  @override
  _EditUserProfileInformationPageState createState() =>
      _EditUserProfileInformationPageState();
}

class _EditUserProfileInformationPageState
    extends State<EditUserProfileInformationPage> {
  final UserController userController = Get.find<UserController>();

  String name;
  String lastName;

  String documentNumber;
  String birthDate;
  String nationality;
  String placeOfBirth;
  String telephoneNumber;

  bool userInformationLoading;
  Information userInformation;

  List<Nationality> nationalities;
  List<Country> countries;

  String selectedNationality;
  String selectedCountry;
  List<String> nationalityOptions;
  List<String> countriesOptions;

  Future getViewData() async {
    this.userInformationLoading = true;
    this.userInformation = await UserUseCases.getUserInformation();
    this.nationalities = await NationalityUseCases.getAllNationalities();
    this.countries = await CountryUseCases.getAllCountries();

    this.nationalityOptions =
        new List.from(this.nationalities.map((e) => e.name));
    this.countriesOptions = new List.from(this.countries.map((e) => e.name));

    this.countries = await CountryUseCases.getAllCountries();
    setState(() {
      this.selectedCountry = this.userInformation.placeOfBirth;
      this.selectedNationality = this.userInformation.nationality;
      this.userInformationLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getViewData();
  }

  Future updateUserProfile() async {
    bool updateUserCheck = await userController.updateUser(
      this.name,
      this.lastName,
    );

    bool updateUserInformationCheck = await UserUseCases.updateUserInformation(
      documentNumber,
      birthDate,
      placeOfBirth,
      nationality,
    );

    if (!(updateUserCheck && updateUserInformationCheck)) {
      Get.snackbar(
        "Error",
        "Occurrio un error",
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.autorenew,
        color: Colors.white,
        iconColor: ParkaColors.parkaGreen,
        onPressedHandler: this.updateUserProfile,
      ),
      backgroundColor: Color(0xff0A7B93),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff0A7B93),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ParkaHeaderSymbol(color: Colors.white),
                    Text(
                      " Editar Perfil",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 9.0, top: 9.0, bottom: 6.0),
                              child: ParkaCircleAvatarWidget(
                                imageUrl:
                                    userController.user.value?.profilePicture,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(3.0, 10.0),
                                          color: Colors.black38,
                                          blurRadius: 5.0,
                                        )
                                      ]),
                                  child: Icon(
                                    Icons.create,
                                    color: Color(0xff086174),
                                    size: 35.0,
                                  ),
                                  padding: EdgeInsets.all(15.0),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ModalProgressHUD(
                inAsyncCall: this.userInformationLoading,
                child: this.userInformationLoading
                    ? Container()
                    : ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              bottom: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff0A7B93),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nombre",
                                  style: kParkaTextStyleBoldWhite24,
                                ),
                                ParkaEditInputText(
                                  value: userController.user.value.name,
                                  onChangedHandler: (String value) {
                                    setState(() {
                                      this.name = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Apellido",
                                  style: kParkaTextStyleBoldWhite24,
                                ),
                                ParkaEditInputText(
                                  value: userController.user.value.lastName,
                                  onChangedHandler: (String value) {
                                    setState(() {
                                      this.lastName = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Documento",
                                  style: kParkaTextStyleBoldWhite24,
                                ),
                                ParkaEditInputText(
                                  value: this.userInformation.document,
                                  textFieldMaxLength: 10,
                                  onChangedHandler: (String value) {
                                    setState(
                                      () {
                                        this.documentNumber = value;
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  "Fecha de nacimiento",
                                  style: kParkaTextStyleBoldWhite24,
                                ),
                                ParkaEditInputText(
                                  value: this
                                      .userInformation
                                      .dateBirth
                                      .split("T")[0]
                                      .split("-")
                                      .join("/"),
                                  onChangedHandler: (String value) {
                                    setState(
                                      () {
                                        this.lastName = value;
                                      },
                                    );
                                  },
                                ),
                                ParkADropdownProfile(
                                  text: "Pais",
                                  textSize: 24.0,
                                  selectedItem: this.selectedCountry,
                                  options: this.countriesOptions,
                                  height: currentScreen.height * 0.07,
                                  width: currentScreen.width,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        this.selectedCountry =
                                            this.countries[value].name;
                                        this.placeOfBirth =
                                            this.countries[value].id;
                                      },
                                    );
                                  },
                                ),
                                ParkADropdownProfile(
                                  text: "Nacionalidad",
                                  textSize: 24.0,
                                  selectedItem: this.selectedNationality,
                                  options: this.nationalityOptions,
                                  height: currentScreen.height * 0.07,
                                  width: currentScreen.width,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        this.selectedNationality =
                                            this.nationalities[value].name;
                                        this.nationality =
                                            this.nationalities[value].id;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: ParkaColors.parkaGreen,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3.0, 7.0),
                                  color: Colors.black38,
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text("Editar Datos personales",
                                    style: kParkaTextStyleBoldWhite20),
                                ParkaEditInput(
                                  value: this.userInformation.telephoneNumber,
                                  textFieldMaxLength: 13,
                                  onChangedHandler: (String value) {
                                    setState(
                                      () {
                                        this.telephoneNumber = value;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
