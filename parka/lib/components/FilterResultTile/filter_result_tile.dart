import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:flutter/material.dart';

class FilterResultTile extends StatelessWidget {
  final String streetAddress;
  final String ownerName;
  final String parkingspace;

  FilterResultTile({
    Key key,
    this.streetAddress,
    this.ownerName,
    this.parkingspace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
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
              child: Icon(
                Icons.local_parking,
                color: ParkaColors.parkaGreen,
                size: 40.0,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(this.streetAddress, style: kParkaTextStyleGrey),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(this.ownerName, style: kParkaInputTextStyleGrey),
                        Text(this.parkingspace,
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
