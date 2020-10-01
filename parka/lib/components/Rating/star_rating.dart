import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({Key key, @required this.rating}) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: this._ratingRowBuilder(),
      ),
    );
  }

  List<Widget> _ratingRowBuilder() {
    List<Widget> starRating = new List<Widget>();

    for (int i = 1; i < 6; i++) {
      IconData iconData = this.rating >= i ? Icons.star : Icons.star_border;

      starRating.add(
        Icon(
          iconData,
          size: 30.0,
          color: ParkaColors.parkaGreen,
        ),
      );
    }

    return starRating;
  }
}
