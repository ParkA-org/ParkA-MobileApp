import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SliverAppBarReservationDetail extends StatelessWidget {
  const SliverAppBarReservationDetail({
    Key key,
    @required Parking parking,
  })  : _parking = parking,
        super(key: key);

  final Parking _parking;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200.0,
      backgroundColor: ParkaColors.parkaGreen,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          margin: EdgeInsets.only(right: 8.0),
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: AutoSizeText(
                  this._parking.parkingName,
                  maxLines: 1,
                  style: kParkaTextStyleBold16,
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Row(
                    children: [
                      AutoSizeText(
                        this._parking.rating.toString(),
                        maxLines: 1,
                        style: kParkaTextStyleBold16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        background: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image(
              fit: BoxFit.cover,
              image: NetworkImage(this._parking.mainPicture),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(0, 140.0),
                  color: Colors.black54,
                  blurRadius: 18.0,
                  spreadRadius: 15.0,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
