import 'package:ParkA/components/Buttons/round_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';

import 'package:ParkA/pages/EditProfilePage/edit_profile_page.dart';
import 'package:ParkA/pages/ProfilePage/components/informative_tab.dart';
import 'package:ParkA/pages/ProfilePage/components/parka_review_history_tile.dart';
import 'package:ParkA/pages/ProfilePage/components/parka_service_history_tile_widget.dart';
import 'package:ParkA/pages/ProfilePage/components/profile_personal_information_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profileScreen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int infoScreenPage = 1;

  void _setPage(int index) {
    setState(() {
      this.infoScreenPage = index;
    });
  }

  Widget _serviceListViewBuilder() {
    return ListView(
      children: [
        ParkaServiceHistoryWidget(),
        ParkaServiceHistoryWidget(),
        ParkaServiceHistoryWidget(),
        ParkaServiceHistoryWidget(),
        ParkaServiceHistoryWidget(),
        ParkaServiceHistoryWidget(),
      ],
    );
  }

  Widget _reviewListView() {
    return ListView(
      children: [
        ParkaReviewHistoryTile(
          rating: 3,
        ),
        ParkaReviewHistoryTile(
          rating: 3,
        )
      ],
    );
  }

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
                        trailing: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, EditProfilePage.routeName);
                          },
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ProfilePersonalInformationWidget(
                          color: Colors.white,
                          showLocation: true,
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
                                isSelected: this.infoScreenPage == 1,
                                onTapHandler: () {
                                  this._setPage(1);
                                },
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
                                isSelected: this.infoScreenPage == 2,
                                onTapHandler: () {
                                  this._setPage(2);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: this.infoScreenPage == 1
                          ? _serviceListViewBuilder()
                          : _reviewListView(),
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
