import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:flutter/material.dart';
import "package:ParkA/components/Utils/styles/text.dart";

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  static const String routeName = "/RegisterPage";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

var createAccount = <String, dynamic>{
  "registerpage": {
    "username": "",
    "lastname": "",
    "email": "",
    "password": "",
    "phone": "",
  },
  "profilepage": {
    "pictures": "",
  },
  "idpage": {
    "document": "",
    "nationality": "",
    "typeDocument": "",
    "Placeofbirth": "",
    "datebirth": "",
  },
  "paymentpage": {
    "digit": "",
    "name": "",
    "expirationdate": "",
  },
  "typedocuments": [],
  "countries": [],
};

class _RegisterPageState extends State<RegisterPage> {
  String username, email, password, confirmpassword, phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: ParkaHeader(
                color: ParkaColors.parkaGreen,
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: viewportConstraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 42.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.account_circle,
                                                  size: 70,
                                                  color: ParkaColors.parkaGreen,
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Crear Cuenta",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      kParkaPageTitleTextStyle,
                                                ),
                                                Spacer(
                                                  flex: 3,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40.0,
                                                vertical: 8.0),
                                            decoration: BoxDecoration(
                                              color: ParkaColors.parkaGreen,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(16.0),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: ParkAInput(
                                                    icon:
                                                        'WhiteProfileIcon.svg',
                                                    text: 'Nombres',
                                                    onChanged: (username) {
                                                      setState(
                                                        () {
                                                          createAccount[
                                                                      "registerpage"]
                                                                  ["username"] =
                                                              username;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ParkAInput(
                                                    icon:
                                                        'WhiteProfileIcon.svg',
                                                    text: 'Apellidos',
                                                    onChanged: (lastname) {
                                                      setState(
                                                        () {
                                                          createAccount[
                                                                      "registerpage"]
                                                                  ["lastname"] =
                                                              lastname;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ParkAInput(
                                                    icon: 'Mail.svg',
                                                    text: 'Correo/Usuario',
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    onChanged: (email) {
                                                      setState(
                                                        () {
                                                          createAccount[
                                                                  "registerpage"]
                                                              ["email"] = email;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ParkAInput(
                                                    icon: 'WhiteLockIcon.svg',
                                                    text: 'Contraseña',
                                                    isPassword: true,
                                                    keyboardType: TextInputType
                                                        .visiblePassword,
                                                    onChanged: (password) {
                                                      setState(
                                                        () {
                                                          createAccount[
                                                                      "registerpage"]
                                                                  ["password"] =
                                                              password;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ParkAInput(
                                                    icon: 'Lockcheck.svg',
                                                    text:
                                                        'Confirmar contraseña',
                                                    isPassword: true,
                                                    keyboardType: TextInputType
                                                        .visiblePassword,
                                                    onChanged:
                                                        (confirmpassword) {
                                                      setState(
                                                        () {
                                                          this.confirmpassword =
                                                              confirmpassword;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ParkAInput(
                                                    icon: 'Phone.svg',
                                                    text: 'Numero de Telefono',
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    onChanged: (phone) {
                                                      setState(
                                                        () {
                                                          createAccount[
                                                                  "registerpage"]
                                                              ["phone"] = phone;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TransparentButton(
                                                    label: 'Continuar',
                                                    buttonTextStyle:
                                                        kParkaButtonTextStyle,
                                                    trailingIconData:
                                                        Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    onTapHandler: () async {
                                                      // This part in future is for validate email are exists
                                                      // var result = await createUser(this.username,
                                                      //     this.lastname, this.email, this.password);
                                                      Navigator.pushNamed(
                                                        context,
                                                        ProfilePicPage
                                                            .routeName,
                                                        arguments:
                                                            createAccount,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
