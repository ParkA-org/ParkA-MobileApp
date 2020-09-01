import 'package:ParkA/components/SearchBar/search_bar.dart';
import 'package:ParkA/pages/Search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummySearch extends StatelessWidget {
  const DummySearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;
    return Container(
      child: GestureDetector(
          child: SearchBar(
            height: currentScreen.height * 0.05,
            enabled: false,
          ),
          onTap: () {
            Scaffold.of(context).showBottomSheet((context) => SearchPage());
          }),
    );
  }
}
