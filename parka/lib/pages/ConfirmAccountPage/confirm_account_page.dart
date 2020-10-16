import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Utils/styles/inputs.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../components/Utils/parkaIcons.dart';

class ConfirmAccountPage extends StatefulWidget {
  static const String routeName = "/confirm-account";

  @override
  _ConfirmAccountPageState createState() => _ConfirmAccountPageState();
}

class _ConfirmAccountPageState extends State<ConfirmAccountPage> {
  String email;
  String code;
  final graphqlClient = Get.find<GraphqlClientController>();

  void nextButtonHandler(bool _omit) async {
    if (_omit) {
      return Get.toNamed(MapPage.routeName);
    }

    final confirmUserResult = await UserUseCases.confirmUserEmail(
      code: this.code,
      email: this.email,
    );

    if (confirmUserResult) {
      Get.snackbar(
        "Cuenta Confirmada",
        "",
        margin: EdgeInsets.all(8.0),
      );
      Get.toNamed(MapPage.routeName);
    } else {
      Get.snackbar(
        "Error",
        "Codigo o correo incorrecto",
        margin: EdgeInsets.all(8.0),
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: ParkaColors.parkaGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3.0, 7.0),
                        color: Colors.black38,
                        blurRadius: 5.0,
                      ),
                    ]),
                alignment: Alignment.centerLeft,
                child: Icon(
                  ParkaIcons.parkaCar,
                  color: Colors.white,
                  size: 130.0,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Confirma tu cuenta",
                      textAlign: TextAlign.center,
                      style: kParkaBigTitleTextStyle.copyWith(fontSize: 32.0),
                    ),
                    Text(
                      "Revisa tu correo e ingresa el codigo para confirmar tu cuenta",
                      textAlign: TextAlign.center,
                      style: kParkaBigTitleTextStyle.copyWith(fontSize: 16.0),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3.0, 10.0),
                              color: Colors.black38,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: TextField(
                        decoration: kInputStyleSlim.copyWith(
                          hintText: "Email",
                        ),
                        onChanged: (String text) {
                          this.email = text;
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3.0, 10.0),
                              color: Colors.black38,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: TextField(
                        maxLength: 6,
                        decoration: kInputStyleSlim.copyWith(
                          hintText: "Insertar Codigo",
                        ),
                        onChanged: (String text) {
                          this.code = text;
                        },
                      ),
                    ),
                    RoundedButton(
                      color: ParkaColors.parkaGreen,
                      label: "Confirmar cuenta",
                      hasIcon: false,
                      hasShadow: false,
                      onTapHandler: () {
                        this.nextButtonHandler(false);
                      },
                    ),
                    TransparentButton(
                      label: "Omitir",
                      color: ParkaColors.parkaGreen,
                      buttonTextStyle: kParkaTextBaseStyleBold,
                      onTapHandler: () {
                        this.nextButtonHandler(true);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
