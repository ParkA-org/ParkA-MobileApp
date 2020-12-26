import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ParkingTile extends StatelessWidget {
  const ParkingTile({
    Key key,
    this.parking,
    this.onTapHandler,
  }) : super(key: key);
  final Parking parking;
  final Function onTapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 5.0),
                        color: Colors.black38,
                        blurRadius: 5.0,
                      )
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("${parking.mainPicture}"))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "${parking.parkingName}",
                        maxFontSize: 24,
                        minFontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        style: kParkaTextBaseStyle.copyWith(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Row(
                        children: [
                          Text(
                            "${parking.rating}",
                            style: kParkaTextBaseStyle.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: ParkaColors.parkaGreen,
                            size: 30.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  color: Color(0xFFA9A5A5),
                  thickness: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
