import 'package:ParkA/components/SearchBar/search_bar.dart';
import 'package:ParkA/pages/Search/search_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummySearch extends StatelessWidget {
  const DummySearch({
    Key key,
    this.buttonToggle,
    this.mainContext,
  }) : super(key: key);

  final VoidCallback buttonToggle;
  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: GestureDetector(
        child: SearchBar(
          hintText: "Buscar...",
          enabled: false,
        ),
        onTap: () async {
          buttonToggle();
          var bottomSheetController = Scaffold.of(context).showBottomSheet(
              (context) => SearchPanel(mainContext: this.mainContext));
          await bottomSheetController.closed;
          buttonToggle();
        },
      ),
    );
  }
}
