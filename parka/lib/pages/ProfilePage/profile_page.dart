import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/ProfilePage/components/informative_tab.dart';
import 'package:ParkA/pages/ProfilePage/components/profile_personal_information_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profileScreen";

  //TODO: Refactor the below widgets to acept data
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkaColors.parkaGreen,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: ParkaHeader(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ProfilePersonalInformationWidget(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InformativeTab(
                                data: "420",
                                informativeMessage:
                                    "Reservaciones como cliente",
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1.0,
                              color: Color(0xFF949494),
                            ),
                            Expanded(
                              child: InformativeTab(
                                data: "69",
                                informativeMessage:
                                    "Reservaciones como anfitrion",
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1.0,
                              color: Color(0xFF949494),
                            ),
                            Expanded(
                              child: InformativeTab(
                                data: "25",
                                informativeMessage: "Reservas Pendientes",
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
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundedButton(
                                hasShadow: false,
                                hasIcon: false,
                                label: "Actividad",
                                color: ParkaColors.parkaGreen,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundedButton(
                                hasShadow: false,
                                hasIcon: false,
                                label: "Resenas",
                                color: ParkaColors.parkaGreen,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ParkaServiceHistoryWidget(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParkaServiceHistoryWidget extends StatelessWidget {
  const ParkaServiceHistoryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Se estaciono en",
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Alma Rosa",
                      style: kParkaBigButtonTextStyle.copyWith(
                        color: ParkaColors.parkaGreen,
                      ),
                    ),
                    Text("Fecha", style: kParkaTextBaseStyle),
                    Text("Vehiculo", style: kParkaTextBaseStyle),
                    Text("Tiempo", style: kParkaTextBaseStyle),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 40.0,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.0,
            color: Color(0xFF949494),
          )
        ],
      ),
    );
  }
}
