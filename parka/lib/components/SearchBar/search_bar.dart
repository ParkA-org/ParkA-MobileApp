import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final double width;

  final double height;

  final double textSize;

  final bool enabled;

  final String hintText;
  const SearchBar(
      {Key key,
      this.height,
      this.width,
      this.textSize,
      this.enabled,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: width ?? 900,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        boxShadow: [
          BoxShadow(
            offset: Offset(5.0, 5.0),
            color: Colors.black54,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.only(left: 25.0, right: 19.0),
      child: TextField(
        enabled: enabled ?? true,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: textSize ?? 25.0,
          ),
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          hintText: hintText ?? 'Buscar...',
          icon: Icon(
            Icons.search,
            size: 35,
            color: Color(0xFF0B768C),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
