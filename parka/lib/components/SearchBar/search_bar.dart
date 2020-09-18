import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final double width;
  final double textSize;
  final bool enabled;
  final String hintText;

  const SearchBar({
    Key key,
    this.width,
    this.textSize,
    this.enabled,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5.0),
            color: Colors.black54,
          ),
        ],
      ),
      child: TextField(
        enabled: enabled ?? true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: textSize ?? 16.0,
          ),
          hintText: hintText ?? 'Buscar...',
          icon: Icon(
            Icons.search,
            size: 24.0,
            color: Color(0xFF0B768C),
          ),
        ),
      ),
    );
  }
}
