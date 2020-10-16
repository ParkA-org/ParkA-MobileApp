import 'package:ParkA/components/menu-item/parka_menu_item.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/ProfilePage/components/profile_personal_information_widget.dart';
import 'package:ParkA/pages/ProfilePage/profile_page.dart';
import 'package:ParkA/pages/UserPaymentMethodPage/user_registered_payment_methods_screen.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivateDrawer extends StatelessWidget {
  PrivateDrawer({Key key}) : super(key: key);

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
                          Navigator.pushNamed(context, ProfileScreen.routeName);
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
                                label: "Mis Reservas",
                              ),
                            ),
                            Expanded(
                              child: ParkAMenuItem(
                                label: "Mis Parqueos",
                              ),
                            ),
                            Expanded(
                              child: ParkAMenuItem(
                                label: "Mis Vehiculos",
                              ),
                            ),
                            Expanded(
                              child: ParkAMenuItem(
                                label: "Favoritos",
                              ),
                            )
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
              child: Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Metodos de pago",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () {
                          Get.toNamed(UserPaymentMethodsScreen.routeName);
                        },
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Chats",
                        itemStyle: kParkaInputDefaultStyleBlue,
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Buscar Parqueo",
                        itemStyle: kParkaInputDefaultStyleBlue,
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Registra tu Parqueo",
                        itemStyle: kParkaInputDefaultStyleBlue,
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Ayuda",
                        itemStyle: kParkaInputDefaultStyleBlue,
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Configuracion",
                        itemStyle: kParkaInputDefaultStyleBlue,
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Salir",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () {
                          Get.find<UserController>().logout();
                          Get.offAllNamed(LoginScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.only(bottom: 10, left: 16.0),
                child: Text(
                  "Terminos y condiciones legales",
                  textAlign: TextAlign.left,
                  style: kParkaInputDefaultStyleBlue.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
