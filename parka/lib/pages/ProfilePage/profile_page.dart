import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profileScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkaColors.parkaGreen,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: ParkaHeader(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ProfilePersonalInformationWidget(),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: InformativeTab(
                              data: "420",
                              informativeMessage: "Reservaciones como cliente",
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
                          Text("driga"),
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

class ProfilePersonalInformationWidget extends StatelessWidget {
  const ProfilePersonalInformationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 40.0,
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Text(
                  "Sebastiano Faiella",
                  style: kParkaInputDefaultSyle,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text("Santo Domingo"),
                    VerticalDivider(
                      thickness: 1.0,
                      color: Color(0xFF949494),
                    ),
                    Icon(Icons.star),
                    Text("4.20")
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class InformativeTab extends StatelessWidget {
  final String data;
  final String informativeMessage;

  const InformativeTab({Key key, this.data, this.informativeMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              this.data,
              style: kParkaBigButtonTextStyle,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              this.informativeMessage,
              textAlign: TextAlign.center,
              style: kParkaInputDefaultSyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
