import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(5.0, 5.0),
          color: Colors.black54,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.only(left: 25.0, right: 19.0),
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 25.0,
          ),
          hintText: 'Buscar...',
          icon: Icon(
            Icons.search,
            size: 35,
            color: Color(0xFF0B768C),
          ),
          border: InputBorder.none,
        ),
      ),
      height: 50,
      width: 20,
    );
  }
}
