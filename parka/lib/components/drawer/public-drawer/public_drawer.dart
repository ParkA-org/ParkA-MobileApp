import 'package:ParkA/components/menu-item/parka_menu_item.dart';
import 'package:ParkA/pages/login/login_screen.dart';
import 'package:ParkA/pages/profile/components/profile_personal_information_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class PublicDrawer extends StatelessWidget {
  PublicDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: ParkaColors.parkaGreen,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: ProfilePersonalInformationWidget(
                          color: Colors.white,
                          showLocation: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Divider(
                        thickness: 1.0,
                        color: Color(0xFF949494),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ParkAMenuItem(
                                label: "Buscar Parqueo",
                              ),
                            ),
                            Expanded(
                              child: ParkAMenuItem(
                                label: "Ayuda",
                              ),
                            ),
                            Expanded(
                              child: ParkAMenuItem(
                                label: "",
                              ),
                            ),
                            Expanded(
                              child: ParkAMenuItem(
                                label: "",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(bottom: 10, left: 16.0),
                child: Text(
                  "Terminos y condiciones legales",
                  textAlign: TextAlign.left,
                  style: kParkaInputDefaultStyleBlue.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
