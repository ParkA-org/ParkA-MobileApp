import 'package:ParkA/components/filter-result-tile/filter_result_tile.dart';
import 'package:ParkA/components/headers/parka_header.dart';

import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'components/favorite_place_button.dart';
import 'components/search_section.dart';

class SearchPanel extends StatelessWidget {
  final BuildContext mainContext;
  const SearchPanel({
    Key key,
    @required this.mainContext,
  }) : super(key: key);
  static const String routeName = "/SearchPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 0,
            child: Container(
              color: ParkaColors.parkaGreen,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(this.mainContext).padding.top),
                child: ParkaHeader(
                  color: Colors.white,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  central: Text(
                    'Buscar Parqueo',
                    style: kParkaTextStyleBoldWhite20,
                    textAlign: TextAlign.center,
                  ),
                  trailing: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: SearchSection(),
          ),
          Expanded(
            flex: 0,
            child: FavoritePlaceButton(),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                FilterResultTile(
                  streetAddress: 'Calle Puerto Rico #175',
                  ownerName: 'Silvio Arzeno',
                  parkingspace: '10 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Calle Bonaire #75',
                  ownerName: 'David Bujosa',
                  parkingspace: '15 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Agora Mall',
                  ownerName: 'Sebastiano Faiella',
                  parkingspace: '20 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Capotillo City',
                  ownerName: 'Cesar Gonzalez',
                  parkingspace: '25 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Parque Juan Pablo Duarte',
                  ownerName: 'Tomas Familia',
                  parkingspace: '30 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Calle Puerto Rico #175',
                  ownerName: 'Silvio Arzeno',
                  parkingspace: '10 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Calle Bonaire #75',
                  ownerName: 'David Bujosa',
                  parkingspace: '15 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Agora Mall',
                  ownerName: 'Sebastiano Faiella',
                  parkingspace: '20 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Capotillo City',
                  ownerName: 'Cesar Gonzalez',
                  parkingspace: '25 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Parque Juan Pablo Duarte',
                  ownerName: 'Tomas Familia',
                  parkingspace: '30 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Calle Puerto Rico #175',
                  ownerName: 'Silvio Arzeno',
                  parkingspace: '10 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Calle Bonaire #75',
                  ownerName: 'David Bujosa',
                  parkingspace: '15 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Agora Mall',
                  ownerName: 'Sebastiano Faiella',
                  parkingspace: '20 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Capotillo City',
                  ownerName: 'Cesar Gonzalez',
                  parkingspace: '25 metros',
                ),
                FilterResultTile(
                  streetAddress: 'Parque Juan Pablo Duarte',
                  ownerName: 'Tomas Familia',
                  parkingspace: '30 metros',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}