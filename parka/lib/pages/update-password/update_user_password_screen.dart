import 'package:ParkA/components/buttons/round_button.dart';
import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class UpdateUserPasswordPage extends StatefulWidget {
  static const String routeName = "/update-user-password";

  @override
  _UpdateUserPasswordPageState createState() => _UpdateUserPasswordPageState();
}

class _UpdateUserPasswordPageState extends State<UpdateUserPasswordPage> {
  String oldPassword;
  String newPassword;
  String confirmNewPassword;
  final graphqlClient = Get.find<GraphqlClientController>();

  void nextButtonHandler(bool _cancel) async {
    print(this.oldPassword);
    print(this.newPassword);
    print(this.confirmNewPassword);

    if (!_cancel) {
      final updatePasswordResult = await UserUseCases.updateUserPassword(
        newPassword: this.newPassword,
        oldPassword: this.oldPassword,
      );

      if (!updatePasswordResult) {
        Get.snackbar(
          "Error",
          "Datos erroneos",
          margin: EdgeInsets.all(8.0),
          backgroundColor: ParkaColors.parkaGoogleRed,
        );
      }
    }

    return Get.back();
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
                      "Actualiza tu contrasena",
                      textAlign: TextAlign.center,
                      style: kParkaBigTitleTextStyle.copyWith(fontSize: 28.0),
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
                        obscureText: true,
                        decoration: kInputStyleSlim.copyWith(
                          hintText: "Contrasena actual",
                        ),
                        onChanged: (String text) {
                          this.oldPassword = text;
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
                        obscureText: true,
                        decoration: kInputStyleSlim.copyWith(
                          hintText: "Nueva contrasena",
                        ),
                        onChanged: (String text) {
                          this.newPassword = text;
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
                        obscureText: true,
                        decoration: kInputStyleSlim.copyWith(
                          hintText: "Confirmar nueva contrasena",
                        ),
                        onChanged: (String text) {
                          this.confirmNewPassword = text;
                        },
                      ),
                    ),
                    RoundedButton(
                      color: ParkaColors.parkaGreen,
                      label: "Actualizar Contrasena",
                      hasIcon: false,
                      hasShadow: false,
                      onTapHandler: () {
                        this.nextButtonHandler(false);
                      },
                    ),
                    TransparentButton(
                      label: "Cancelar",
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
