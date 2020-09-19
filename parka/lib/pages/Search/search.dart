import 'package:ParkA/components/FilterResultTile/filter_result_tile.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:flutter/material.dart';
import '../../components/Headers/parka_header.dart';
import '../../components/Utils/styles/parka_colors.dart';
import 'Components/favorite_place_button.dart';
import 'Components/search_section.dart';

class SearchPage extends StatelessWidget {
  final BuildContext mainContext;
  const SearchPage({
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
