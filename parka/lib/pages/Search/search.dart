import 'package:ParkA/components/FilterResultTile/filter_result_tile.dart';
import 'package:flutter/material.dart';
import '../../components/Headers/parka_header.dart';
import '../../components/Utils/styles/parka_colors.dart';
import 'Components/favorite_place_button.dart';
import 'Components/search_section.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key, @required this.mainContext}) : super(key: key);
  static const String routeName = "/SearchPage";

  final mainContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Color(0xFF0B768C),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(this.mainContext).viewInsets.top),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(this.mainContext).padding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    color: ParkaColors.parkaGreen,
                    child: ParkaHeader(
                      color: Colors.white,
                      leading: Icon(Icons.arrow_back_ios),
                      central: Text(
                        'Buscar Parqueo',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      trailing: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
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
                      FilterResultTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
