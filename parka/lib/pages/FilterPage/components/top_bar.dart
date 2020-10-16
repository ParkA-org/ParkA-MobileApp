import 'package:ParkA/styles/parka_colors.dart';
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
              color: ParkaColors.parkaGreen,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.replay,
              color: ParkaColors.parkaLightRed,
              size: 32.0,
            ),
            onTap: this.onTapHandler,
          )
        ],
      ),
    );
  }
}
