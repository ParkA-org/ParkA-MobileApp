import 'package:ParkA/components/MenuItem/parka_menu_item.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/Search/search.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Drawer(
      child: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Column(children: [
            Container(
              height: screenSize.height * 0.42,
              color: ParkaColors.parkaGreen,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.46,
                                    child: Text(
                                      "Sebastiano Faiella",
                                      style: kParkaInputDefaultSyle.copyWith(
                                          fontSize: 16),
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
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
                                        padding:
                                            const EdgeInsets.only(bottom: 2),
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
          ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Container(
              height: screenSize.height * 0.75,
              width: screenSize.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(
                    height: screenSize.height * 0.001,
                  ),
                  ParkAMenuItem(
                    label: "Metodos de pago",
                    itemStyle: kParkaInputDefaultStyleBlue,
                  ),
                  ParkAMenuItem(
                    label: "Chats",
                    itemStyle: kParkaInputDefaultStyleBlue,
                  ),
                  ParkAMenuItem(
                    label: "Buscar Parqueo",
                    itemStyle: kParkaInputDefaultStyleBlue,
                  ),
                  ParkAMenuItem(
                    label: "Registra tu Parqueo",
                    itemStyle: kParkaInputDefaultStyleBlue,
                  ),
                  ParkAMenuItem(
                    label: "Ayuda",
                    itemStyle: kParkaInputDefaultStyleBlue,
                  ),
                  ParkAMenuItem(
                    label: "Configuracion",
                    itemStyle: kParkaInputDefaultStyleBlue,
                  ),
                  ParkAMenuItem(
                    label: "Salir",
                    itemStyle: kParkaInputDefaultStyleBlue,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: screenSize.width * 0.6,
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Terminos y condiciones legales",
              textAlign: TextAlign.left,
              style: kParkaInputDefaultStyleBlue.copyWith(
                  fontWeight: FontWeight.normal, fontSize: 14),
            ),
          )
        ]),
      ),
    );
  }
}
