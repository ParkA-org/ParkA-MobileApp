import 'package:ParkA/styles/parka_colors.dart';
import "package:flutter/material.dart";

class StarRatingFilter extends StatelessWidget {
  final double rating;
  final Function rateHandler;

  const StarRatingFilter({
    @required this.rating,
    @required this.rateHandler,
    Key key,
  }) : super(key: key);

  List<Widget> _reviewStars() {
    List<Widget> ret = new List<Widget>();

    for (int i = 1; i <= 5; ++i) {
      IconData _icon = this.rating >= i ? Icons.star : Icons.star_border;

      ret.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              this.rateHandler(i);
            },
            child: Icon(
              _icon,
              color: ParkaColors.parkaGreen,
              size: 45.0,
            ),
          ),
        ),
      );
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Puntuacion Minima",
                style: TextStyle(
                    color: ParkaColors.parkaGreen,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: this._reviewStars(),
            ),
          ),
        ],
      ),
    );
  }
}
