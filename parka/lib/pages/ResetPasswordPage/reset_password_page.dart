import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Utils/styles/inputs.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../components/Utils/parkaIcons.dart';

class ResetPasswordPage extends StatefulWidget {
  static const String routeName = "/reset-password";

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String email;
  String password;
  String confirmPassword;
  String code;
  final graphqlClient = Get.find<GraphqlClientController>();

  void nextButtonHandler(bool _cancel) async {
    print(this.code);
    print(this.password);
    print(this.email);

    if (_cancel) {
      return Get.toNamed(EmailLogin.routeName);
    }

    final resetPasswordResult = await UserUseCases.resetPassword(
      code: this.code,
      email: this.email,
      password: this.password,
    );

    if (resetPasswordResult) {
      Get.snackbar(
        "Password cambiado correctamente",
        "",
        margin: EdgeInsets.all(8.0),
      );
      Get.toNamed(MapPage.routeName);
    } else {
      Get.snackbar(
        "Error",
        "Datos erroneos",
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
                      "Cambia tu contrasena",
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
                        obscureText: true,
                        decoration: kInputStyleSlim.copyWith(
                          hintText: "Nueva Contrasena",
                        ),
                        onChanged: (String text) {
                          this.password = text;
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
                          this.confirmPassword = text;
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
                      label: "Cambiar Contrasena",
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
