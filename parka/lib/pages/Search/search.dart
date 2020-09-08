import 'package:ParkA/components/FilterResultTile/filter_result_tile.dart';
import 'package:flutter/material.dart';
import 'Components/favorite_place_button.dart';
import 'Components/search_section.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF0B768C),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: SearchSection(),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: FavoritePlaceButton(),
              ),
              Expanded(
                flex: 3,
                child: ListView(
                  children: [
                    FilterResultTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
