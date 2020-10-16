import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/inputs/parka_input.dart';

import 'package:ParkA/data/use-cases/user/dtos/user_registration_dto.dart';
import 'package:ParkA/pages/profile-picture/profile_pic_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  static const String routeName = "/RegisterPage";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

UserRegistrationForm userRegistrationForm = new UserRegistrationForm();

class _RegisterPageState extends State<RegisterPage> {
  String name;
  String lastName;
  String email;
  String password;
  String confirmpassword;
  String telephonNumber;

  void nextButtonHandler() {
    userRegistrationForm.createUserDto.name = this.name;
    userRegistrationForm.createUserDto.lastName = this.lastName;
    userRegistrationForm.createUserDto.email = this.email;
    userRegistrationForm.createUserDto.password = this.password;
    userRegistrationForm.createUserInformationDto.telephonNumber =
        this.telephonNumber;

    Navigator.pushNamed(
      context,
      ProfilePicPage.routeName,
      arguments: userRegistrationForm,
    );
  }

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
                                                    text: 'Nombre',
                                                    onChanged: (name) {
                                                      setState(
                                                        () {
                                                          this.name = name;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ParkAInput(
                                                    icon:
                                                        'WhiteProfileIcon.svg',
                                                    text: 'Apellido',
                                                    onChanged: (lastName) {
                                                      setState(
                                                        () {
                                                          this.lastName =
                                                              lastName;
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
                                                          this.email = email;
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
                                                          this.password =
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
                                                    onChanged:
                                                        (telephonNumber) {
                                                      setState(
                                                        () {
                                                          this.telephonNumber =
                                                              telephonNumber;
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
                                                      trailingIconData: Icons
                                                          .arrow_forward_ios,
                                                      color: Colors.white,
                                                      onTapHandler:
                                                          nextButtonHandler),
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
