import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/ProfilePage/components/informative_tab.dart';
import 'package:ParkA/pages/ProfilePage/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/pages/ProfilePage/components/parka_service_history_tile_widget.dart';
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
                          ParkaReviewHistoryTile(
                            rating: 3,
                          ),
                          ParkaReviewHistoryTile(
                            rating: 3,
                          )
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

class ParkaReviewHistoryTile extends StatelessWidget {
  final double rating;

  const ParkaReviewHistoryTile({
    Key key,
    @required this.rating,
  }) : super(key: key);

  List<Widget> _ratingRowBuilder() {
    List<Widget> ret = new List<Widget>();

    for (int i = 1; i < 6; i++) {
      IconData iconData = this.rating >= i ? Icons.star : Icons.star_border;

      ret.add(
        Icon(
          iconData,
          size: 30.0,
          color: ParkaColors.parkaGreen,
        ),
      );
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double tileHeight = constraints.maxWidth / 2.5;
        final double imageContainerSize =
            (constraints.maxHeight < constraints.maxWidth
                    ? constraints.maxHeight
                    : constraints.maxWidth) /
                6;

        return Container(
          height: tileHeight,
          // color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      width: imageContainerSize,
                      height: imageContainerSize,
                      child: ParkaCircleAvatarWidget(
                        pictureSizeDivider: 2.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "David Putosa",
                          style: kParkaButtonTextStyle.copyWith(
                            fontSize: 22.0,
                          ),
                        ),
                        Row(
                          children: this._ratingRowBuilder(),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Me agrado poco el parqueo me dieron golpe y me amenazaron con una apunalada",
                  style: kParkaInputTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Text(
                "Hace 6 meses",
                style: kParkaInputTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Color(
                    0xFF7B7777,
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Color(0xFF949494),
              ),
            ],
          ),
        );
      },
    );
  }
}
