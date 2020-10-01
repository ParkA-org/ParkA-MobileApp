import 'package:ParkA/components/Alerts/parka_base_alert_widget.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/components/Utils/functions.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/pages/ForgotPassword/forgot_password_screen.dart';
import 'package:ParkA/pages/Login/utils/utils.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import 'package:ParkA/use-cases/user/user_use_cases.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:graphql/client.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key, this.screenSize}) : super(key: key);
  final Size screenSize;
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String user, password;
  QueryResult result;

  Future loginHandler() async {
    bool checkEmail = GetUtils.isEmail(this.user);
    bool checkPassword = GetUtils.isLengthGreaterOrEqual(this.password, 8);

    if (!checkEmail || !checkPassword) {
      Get.snackbar(
        "Error",
        "Formato credenciales incorrecto",
        margin: EdgeInsets.all(8.0),
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
      return;
    }

    bool loginCheck =
        await Get.find<UserController>().loginUser(this.user, this.password);

    if (!loginCheck) {
      Get.snackbar(
        "Error",
        "Credenciales incorrectas",
        margin: EdgeInsets.all(8.0),
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
      return;
    }

    Get.toNamed(MapPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: WavyClipper.withTopWave(
        child: Container(
          color: ParkaColors.parkaGreen,
          child:
              //Login inputs container
              Container(
            margin: EdgeInsets.fromLTRB(
                widget.screenSize.height * 0.05,
                widget.screenSize.height * 0.07,
                widget.screenSize.height * 0.05,
                0),
            child: Column(
              children: [
                SizedBox(
                  height: widget.screenSize.height * 0.025,
                ),
                ParkAInput(
                  icon: 'WhiteProfileIcon.svg',
                  text: 'Correo / Usuario',
                  onChanged: (String user) {
                    setState(() {
                      this.user = user.trim();
                    });
                  },
                ),
                SizedBox(
                  height: widget.screenSize.height * 0.03,
                ),
                ParkAInput(
                  icon: 'WhiteLockIcon.svg',
                  text: 'Contraseña',
                  isPassword: true,
                  keyboardType: TextInputType.text,
                  onChanged: (String password) {
                    setState(() {
                      this.password = password.trim();
                    });
                  },
                ),
                SizedBox(
                  height: widget.screenSize.height * 0.025,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName);
                  },
                  child: Text(
                    "Olvide mi contraseña",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: widget.screenSize.height * 0.03,
                ),
                MaterialButton(
                  color: ParkaColors.parkaLimeGreen,
                  height: widget.screenSize.height * 0.085,
                  minWidth: widget.screenSize.width * 0.5,
                  elevation: 20,
                  shape: StadiumBorder(),
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: this.loginHandler,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
