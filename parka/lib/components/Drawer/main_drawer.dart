import 'package:ParkA/components/MenuItem/parka_menu_item.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/ProfilePage/components/profile_personal_information_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../pages/Login/login_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

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
                      child: ProfilePersonalInformationWidget(
                        color: Colors.white,
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

class UserData extends StatelessWidget {
  const UserData({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: ParkaColors.parkaGreen,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.46,
                          child: AutoSizeText(
                            "David",
                            style:
                                kParkaInputDefaultSyle.copyWith(fontSize: 22),
                            softWrap: false,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            minFontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "4.20",
                              style: kParkaInputDefaultSyle.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Icon(Icons.star_border,
                                  color: Colors.white, size: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
          ]),
        ),
      ),
      ParkAMenuItem(
        label: "Mis Reservas",
      ),
      ParkAMenuItem(
        label: "Mis Parqueos",
      ),
      ParkAMenuItem(
        label: "Mis Vehiculos",
      ),
      ParkAMenuItem(
        label: "Favoritos",
      ),
    ]);
  }
}
