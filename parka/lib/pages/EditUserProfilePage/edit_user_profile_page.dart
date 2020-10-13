import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/inputs.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/data_models/information/information_data_model.dart';
import 'package:ParkA/use-cases/user/user_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  List nationalities;
  List countries;

  Future getViewData() async {
    this.userInformationLoading = true;
    this.userInformation = await UserUseCases.getUserInformation();
    setState(() {
      this.userInformationLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getViewData();
  }

  //TODO: add updates for birthDate, Nationality and Country
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ParkaColors.parkaGreen,
        child: Icon(Icons.autorenew),
        onPressed: () {
          this.updateUserProfile();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: ParkaColors.parkaGreen,
                ),
                child: ParkaHeader(color: Colors.white),
              ),
            ),
            Expanded(
              child: ModalProgressHUD(
                inAsyncCall: this.userInformationLoading,
                child: this.userInformationLoading
                    ? Container()
                    : ListView(
                        children: [
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Editar Nombre de Cuenta",
                                    style: kParkaTextStyleBoldWhite20,
                                  ),
                                ),
                                ParkaEditInput(
                                  value: userController.user.value.name,
                                  onChangedHandler: (String value) {
                                    setState(() {
                                      this.name = value;
                                    });
                                  },
                                ),
                                ParkaEditInput(
                                  value: userController.user.value.lastName,
                                  onChangedHandler: (String value) {
                                    setState(() {
                                      this.lastName = value;
                                    });
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
                                  value: this.userInformation.document,
                                  onChangedHandler: (String value) {
                                    setState(
                                      () {
                                        this.documentNumber = value;
                                      },
                                    );
                                  },
                                ),
                                ParkaEditInput(
                                  value: this.userInformation.telephoneNumber,
                                  onChangedHandler: (String value) {
                                    setState(
                                      () {
                                        this.telephoneNumber = value;
                                      },
                                    );
                                  },
                                ),
                                ParkaEditInput(
                                  value: this
                                      .userInformation
                                      .dateBirth
                                      .split("T")[0]
                                      .split("-")
                                      .join(" "),
                                  onChangedHandler: (String value) {
                                    setState(
                                      () {
                                        this.lastName = value;
                                      },
                                    );
                                  },
                                ),
                                ParkaEditInput(
                                  value: this.userInformation.placeOfBirth,
                                  onChangedHandler: (String value) {
                                    setState(() {
                                      this.lastName = value;
                                    });
                                  },
                                ),
                                ParkaEditInput(
                                  value: this.userInformation.nationality,
                                  onChangedHandler: (String value) {
                                    setState(() {
                                      this.lastName = value;
                                    });
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

class ParkaEditInput extends StatelessWidget {
  final String label;
  final String value;
  final Function onChangedHandler;

  const ParkaEditInput({
    Key key,
    this.label,
    this.value,
    this.onChangedHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(3.0, 10.0),
              color: Colors.black38,
              blurRadius: 5.0,
            ),
          ]),
      child: TextField(
        decoration: kInputStyleSlim.copyWith(
          // labelText: this.label,

          hintText: this.value,
        ),
        onChanged: this.onChangedHandler,
      ),
    );
  }
}
