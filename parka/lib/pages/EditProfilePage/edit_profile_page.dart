import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/inputs.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/ProfilePage/components/parka_circle_avatar_widget.dart';
import "package:flutter/material.dart";

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
                    trailing: Text(
                      "Guardar",
                      style: kParkaInputDefaultSyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sebastiano Gutierrez",
                    style: kParkaPageTitleTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ParkaCircleAvatarWidget(),
                ),
              ),
              Expanded(
                child: ParkaTelephoneNumberInput(
                  telephoneNumberHandler: this.telephoneNumberHandler,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ParkaEditProfileTile(
                          color: Colors.white,
                          label: "Cambiar Contrasena",
                          iconData: Icons.lock_outline,
                        ),
                      ),
                      Expanded(
                        child: ParkaEditProfileTile(
                          color: Colors.white,
                          label: "Metodos de Pago",
                          iconData: Icons.account_balance_wallet,
                        ),
                      ),
                      Expanded(
                        child: ParkaEditProfileTile(
                          color: Colors.white,
                          label: "Vehiculos",
                          iconData: Icons.directions_car,
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
