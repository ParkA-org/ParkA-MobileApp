import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/inputs/parka_input.dart';
import 'package:ParkA/controllers/register-user-form/register_user_controller.dart';
import 'package:ParkA/pages/register/steps/profile_pic_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = "/RegisterPage";
  final RegisterUSerController _registerUSerController =
      Get.find<RegisterUSerController>();

  void nextButtonHandler() {
    Get.toNamed(ProfilePicturePage.routeName);
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
                                                      _registerUSerController
                                                          .setName(name);
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ParkAInput(
                                                    icon:
                                                        'WhiteProfileIcon.svg',
                                                    text: 'Apellido',
                                                    onChanged: (lastName) {
                                                      _registerUSerController
                                                          .setLastName(
                                                              lastName);
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
                                                      _registerUSerController
                                                          .setEmail(email);
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
                                                      _registerUSerController
                                                          .setPassword(
                                                              password);
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
                                                    onChanged: (String
                                                        confirmpassword) {},
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
                                                      _registerUSerController
                                                          .setPhoneNumber(
                                                              telephonNumber);
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
                                                    onTapHandler:
                                                        nextButtonHandler,
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
