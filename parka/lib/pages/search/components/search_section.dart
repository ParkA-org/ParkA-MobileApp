import 'package:ParkA/components/search-bar/search_bar.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import '../../filter/filter_page.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: ParkaColors.parkaGreen,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 5,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: SearchBar()),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5.0),
                      color: Colors.black54,
                    ),
                  ],
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.black12, // inkwell color
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.filter_alt,
                          size: 30,
                          color: Color(0xFF0B768C),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, FilterPage.routeName);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
