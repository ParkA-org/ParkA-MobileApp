import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class FilterResultTile extends StatelessWidget {
  final String parkingName;
  final String parkingPrice;
  final String rating;

  FilterResultTile({
    Key key,
    this.parkingName,
    this.parkingPrice,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: ParkaColors.parkaLightGrey,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'resources/images/green-search-pin.png',
                  scale: 2.5,
                )),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(this.parkingName, style: kParkaTextStyleGrey),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(this.parkingPrice,
                            style: kParkaInputTextStyleGrey),
                        Text(this.rating,
                            textAlign: TextAlign.right,
                            style: kParkaInputTextStyleGrey),
                      ],
                    ),
                  ),
                  Divider(
                    color: ParkaColors.parkaGreen,
                    thickness: 1.6,
                    endIndent: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
