import "package:flutter/material.dart";

class StarRatingFilter extends StatelessWidget {
  final int rating;
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
              color: Color(0xFF0B768C),
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
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Puntuacion Minima",
              style: TextStyle(
                  color: Color(0xFF0B768C),
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
    );
  }
}
