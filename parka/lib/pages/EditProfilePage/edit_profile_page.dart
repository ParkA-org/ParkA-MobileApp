import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/pages/EditUserProfilePage/edit_user_profile_page.dart';
import 'package:ParkA/pages/ProfilePage/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/pages/UpdatePasswordScreen/update_user_password_screen.dart';
import 'package:ParkA/pages/UserPaymentMethodPage/user_registered_payment_methods_screen.dart';
import 'package:ParkA/pages/VehiclePage/vehicle_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'components/parka_edit_profile_tile.dart';
import 'components/parka_telephone_number_input.dart';

class EditProfilePage extends StatefulWidget {
  static String routeName = "/edit-profile";

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String telephoneNumberPrefix;
  String telephoneNumber;
  String fullTelephoneNumber;

  void telephoneNumberHandler(String text, bool isPrefix) {
    setState(() {
      if (isPrefix) {
        this.telephoneNumberPrefix = text;
      } else {
        this.telephoneNumber = text;
      }
      this.fullTelephoneNumber =
          '+${this.telephoneNumberPrefix} ${this.telephoneNumber}';
    });
    print(this.fullTelephoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ParkaColors.parkaGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ParkaHeader(
                    color: Colors.white,
                    leading: GestureDetector(
                      child: Icon(Icons.arrow_back_ios),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    // trailing: Text(
                    //   "Guardar",
                    //   style: kParkaInputDefaultSyle,
                    // ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => AutoSizeText(
                      "${userController.user.value?.name} ${userController.user.value?.lastName}",
                      style: kParkaPageTitleTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ParkaCircleAvatarWidget(
                    imageUrl: userController.user.value?.profilePicture,
                  ),
                ),
              ),
              // Expanded(
              //   child: ParkaTelephoneNumberInput(
              //     telephoneNumberHandler: this.telephoneNumberHandler,
              //   ),
              // ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ParkaEditProfileTile(
                          color: Colors.white,
                          label: "Editar Perfil",
                          iconData: Icons.account_circle,
                          onTapHandler: () {
                            Get.toNamed(
                              EditUserProfileInformationPage.routeName,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ParkaEditProfileTile(
                          color: Colors.white,
                          label: "Cambiar Contrasena",
                          iconData: Icons.lock_outline,
                          onTapHandler: () {
                            Get.toNamed(
                              UpdateUserPasswordPage.routeName,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ParkaEditProfileTile(
                          color: Colors.white,
                          label: "Metodos de Pago",
                          iconData: Icons.account_balance_wallet,
                          onTapHandler: () {
                            Get.toNamed(UserPaymentMethodsScreen.routeName);
                          },
                        ),
                      ),
                      Expanded(
                        child: ParkaEditProfileTile(
                          color: Colors.white,
                          label: "Vehiculos",
                          iconData: Icons.directions_car,
                          onTapHandler: () {
                            Get.toNamed(VehiclePage.routeName);
                          },
                        ),
                      ),
                      Expanded(
                        child: ParkaEditProfileTile(
                          color: Colors.white,
                          label: "Parqueos",
                          iconData: Icons.location_on,
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
    );
  }
}
