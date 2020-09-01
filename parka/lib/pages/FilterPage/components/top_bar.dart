import 'package:flutter/material.dart';

class FilterPageTopBar extends StatelessWidget {
  const FilterPageTopBar({
    Key key,
    this.onTapHandler,
  }) : super(key: key);

  final Function onTapHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Filtros",
            style: TextStyle(
              color: Color(0xFF0B768C),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            child: Text(
              "Reiniciar",
              style: TextStyle(
                color: Color(0xFFED9393),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: this.onTapHandler,
          )
        ],
      ),
    );
  }
}
